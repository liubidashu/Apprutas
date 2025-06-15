//
//  ViewModel.swift
//  Apprutas
//
//  Created by Дарья Любивая on 05.03.2025.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showAlert = false
    @Published var isAuthenticated = false
    @Published var shouldShowRegistrationView = false // Для перенаправления на регистрацию
    
    private let baseURL = "http://localhost:3000/api/v1"
    private static let decoder = JSONDecoder()
    
    // MARK: - Регистрация
    func signUp(email: String, password: String, passwordConfirmation: String) {
        guard password == passwordConfirmation else {
            showError("Пароли не совпадают")
            return
        }
        
        guard password.count >= 6 else {
            showError("Пароль должен содержать минимум 6 символов")
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "\(baseURL)/sign_up")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Правильный формат данных с вложенностью "user"
        let userData: [String: Any] = [
            "user": [
                "email": email,
                "password": password,
                "password_confermation": passwordConfirmation
            ]
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: userData, options: [])
            print("[Auth] Отправка запроса на регистрацию:", userData)
        } catch {
            showError("Ошибка формирования запроса")
            return
        }
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.showError("Сетевая ошибка: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self?.showError("Некорректный ответ сервера")
                    return
                }
                
                print("[Auth] Статус код:", httpResponse.statusCode)
                
                if let data = data {
                    print("[Auth] Ответ сервера:", String(data: data, encoding: .utf8) ?? "Нет данных")
                }
                
                switch httpResponse.statusCode {
                case 201:
                    do {
                        let response = try Self.decoder.decode(RegistrationResponse.self, from: data!)
                        print("[Auth] Успешная регистрация. ID пользователя:", response.user.id)
//                        self?.signIn(email: email, password: password)
                        UserDefaults.standard.set(response.user.jwt, forKey: "authToken") // Сохраняем токен
                        self?.isAuthenticated = true
                        print("[Auth] Успешный регистраций. Токен:", response.user.jwt)
                    } catch {
                        self?.showError("Ошибка при обработке ответа сервера")
                    }
                    
                case 422:
                    self?.parseValidationError(data: data)
                    
                default:
                    self?.showError("Ошибка сервера (код \(httpResponse.statusCode))")
                }
            }
        }.resume()
    }
    
    // MARK: - Авторизация
    func signIn(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "\(baseURL)/sign_in")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let credentials: [String: Any] = [
            "user": [
                "email": email,
                "password": password
            ]
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: credentials)
            print("[Auth] Отправка запроса на вход:", credentials)
        } catch {
            showError("Ошибка формирования запроса")
            return
        }
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.showError("Сетевая ошибка: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self?.showError("Некорректный ответ сервера")
                    return
                }
                
                print("[Auth] Статус код:", httpResponse.statusCode)
                
                guard let data = data else {
                    self?.showError("Нет данных в ответе")
                    return
                }
                
                print("[Auth] Ответ сервера:", String(data: data, encoding: .utf8) ?? "Нет данных")
                
                switch httpResponse.statusCode {
                case 200:
                    do {
                        let response = try Self.decoder.decode(RegistrationResponse.self, from: data)
                        UserDefaults.standard.set(response.user.jwt, forKey: "authToken") // Сохраняем токен
                        self?.isAuthenticated = true
                        print("[Auth] Успешный вход. Токен:", response.user.jwt)
                    } catch {
                        self?.showError("Ошибка декодирования токена")
                    }
                    
                case 401:
                    self?.showError("Неверный email или пароль")
                    
                default:
                    self?.showError("Ошибка сервера (код \(httpResponse.statusCode))")
                }
            }
        }.resume()
    }
    
    // MARK: - Выход
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "authToken") // Очищаем токен
        isAuthenticated = false
    }
    
    // MARK: - Удаление аккаунта
    func deleteAccount(completion: @escaping (Bool) -> Void) {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("[Auth] Токен не найден")
            completion(false)
            return
        }
        
        let url = URL(string: "\(baseURL)/delete_account")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("[Auth] Ошибка при удалении аккаунта:", error.localizedDescription)
                    completion(false)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("[Auth] Некорректный ответ сервера")
                    completion(false)
                    return
                }
                
                switch httpResponse.statusCode {
                case 200:
                    // Успешное удаление
                    UserDefaults.standard.removeObject(forKey: "authToken") // Очищаем токен
                    self?.isAuthenticated = false
                    self?.shouldShowRegistrationView = true // Перенаправляем на регистрацию
                    print("[Auth] Аккаунт успешно удален")
                    completion(true)
                    
                case 401:
                    print("[Auth] Ошибка: Неавторизованный доступ")
                    completion(false)
                    
                default:
                    print("[Auth] Ошибка сервера (код \(httpResponse.statusCode))")
                    completion(false)
                }
            }
        }.resume()
    }
    
    // MARK: - Вспомогательные методы
    private func parseValidationError(data: Data?) {
        guard let data = data else {
            showError("Ошибка валидации: нет данных")
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            
            if let errors = json?["errors"] as? [String: [String]] {
                let errorMessages = errors.values.flatMap { $0 }.joined(separator: "\n")
                showError(errorMessages)
            } else if let error = json?["error"] as? String {
                showError(error)
            } else {
                showError("Неизвестная ошибка валидации")
            }
        } catch {
            showError("Ошибка разбора ошибки валидации")
        }
    }
    
    func showError(_ message: String) {
        errorMessage = message
        showAlert = true
        isLoading = false
        print("[Auth] Ошибка:", message)
    }
}

// MARK: - RegistrationResponse
struct RegistrationResponse: Codable {
    let message: String
    let user: User
    
    // MARK: - User
    struct User: Codable {
        let id: Int
        let email, jwt: String
    }
}


//// Модели для парсинга ответов
//struct RegistrationResponse: Codable {
//    let message: String
//    let user: User
//    
//    struct User: Codable {
//        let id: Int
//        let email: String
//        let created_at: String
//        let updated_at: String
//        let admin: Bool
//        let jti: String
//    }
//}
