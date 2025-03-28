//
//  RegistrationView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 05.03.2025.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @FocusState private var focusedField: Field?
    
    private let accentColor = Color(red: 0.737, green: 0.780, blue: 0.196)
    
    enum Field {
        case email, password, confirmPassword
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Spacer().frame(height: 40)
                        
                        // Заголовок
                        VStack(alignment: .leading, spacing: 8) {
                            Text("впервые здесь?")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("самое время зарегистрироваться!")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 20)
                        
                        // Поле email
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 2) {
                                Text("почта")
                                    .font(.headline)
                                Text("*")
                                    .font(.title2)
                                    .foregroundColor(accentColor)
                            }
                            
                            TextField("введите email", text: $email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .focused($focusedField, equals: .email)
                                .submitLabel(.next)
                                .onSubmit {
                                    focusedField = .password
                                }
                            
                            Divider()
                        }
                        .padding(.bottom, 16)
                        
                        // Поле пароля
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 2) {
                                Text("пароль")
                                    .font(.headline)
                                Text("*")
                                    .font(.title2)
                                    .foregroundColor(accentColor)
                            }
                            
                            SecureField("введите пароль", text: $password)
                                .textContentType(.oneTimeCode) // Отключаем автозаполнение
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .focused($focusedField, equals: .password)
                                .submitLabel(.next)
                                .onSubmit {
                                    focusedField = .confirmPassword
                                }
                            
                            Divider()
                        }
                        .padding(.bottom, 16)
                        
                        // Подтверждение пароля
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 2) {
                                Text("подтвердите пароль")
                                    .font(.headline)
                                Text("*")
                                    .font(.title2)
                                    .foregroundColor(accentColor)
                            }
                            
                            SecureField("повторите пароль", text: $confirmPassword)
                                .textContentType(.oneTimeCode) // Отключаем автозаполнение
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .focused($focusedField, equals: .confirmPassword)
                                .submitLabel(.done)
                            
                            Divider()
                        }
                        .padding(.bottom, 16)
                        
                        // Кнопка "Готово"
                        Button(action: register) {
                            Text("готово")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(formIsValid ? accentColor : Color(.systemGray5))
                                .foregroundColor(.black)
                        }
                        .disabled(!formIsValid)
                        .padding(.vertical, 16)
                        
                        // Ссылка на вход
                        HStack {
                            Spacer()
                            Text("уже есть аккаунт?")
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: AuthView()) {
                                Text("войти")
                                    .underline()
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }
                    }
                    .padding()
                }
                
                // Индикатор загрузки
                if viewModel.isLoading {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView()
                        .scaleEffect(2)
                        .tint(.white)
                }
            }
            .alert("Ошибка", isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage ?? "Неизвестная ошибка")
            }
            .navigationTitle("регистрация")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("готово") {
                        focusedField = nil
                    }
                }
            }
        }
    }
    
    // Проверка валидности формы
    private var formIsValid: Bool {
        !viewModel.isLoading &&
        !email.isEmpty &&
        email.contains("@") &&
        email.contains(".") &&
        !password.isEmpty &&
        password.count >= 6 &&
        !confirmPassword.isEmpty &&
        password == confirmPassword
    }
    
    // Метод регистрации
    private func register() {
        guard formIsValid else {
            viewModel.showError("Проверьте введенные данные")
            return
        }
        
        // Проверка длины пароля
        if password.count < 6 {
            viewModel.showError("Пароль должен содержать минимум 6 символов")
            return
        }
        
        // Вызов регистрации
        viewModel.signUp(
            email: email,
            password: password,
            passwordConfirmation: confirmPassword
        )
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
