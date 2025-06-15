//
//  Auth.swift
//  Apprutas
//
//  Created by Дарья Любивая on 05.03.2025.
//
//

import SwiftUI

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()
    @State private var email: String = "user1@email.com"
    @State private var password: String = "passpass"
    @State private var showRootTabView = false // Новое состояние для перехода
    
    private let accentColor = Color(red: 0.737, green: 0.780, blue: 0.196) // HEX BCD232
    
    var body: some View {
        NavigationView {
            ZStack {
                // Основной контент авторизации
                authContent
                
                // Полноэкранное покрытие для RootTabView
                if viewModel.isAuthenticated {
                    RootTabView()
                        .transition(.opacity)
                        .zIndex(1) // Помещаем поверх всего
                }
            }
            .navigationBarHidden(viewModel.isAuthenticated) // Скрываем навбар при переходе
        }
    }
    
    // Выносим основной контент в отдельную переменную для чистоты
    private var authContent: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 0) {
                    Spacer().frame(height: 80)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("привет!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("авторизуйся, чтобы публиковать маршруты и участвовать в обсуждениях")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer().frame(height: 30)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        authField(title: "почта", text: $email, isSecure: false)
                        authField(title: "пароль", text: $password, isSecure: true)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                    
                    Button(action: {
                        viewModel.signIn(email: email, password: password)
                    }) {
                        Text("войти")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(formIsValid ? accentColor : Color(.systemGray5))
                            .foregroundColor(.black)
                    }
                    .disabled(!formIsValid)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                    
                    NavigationLink(destination: RegistrationView()) {
                        Text("еще нет аккаунта? зарегистрироваться")
                            .foregroundColor(.black)
                            .underline()
                    }
                    .padding(.bottom, 24)
                }
            }
            
            if viewModel.isLoading {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                ProgressView()
                    .scaleEffect(2)
                    .tint(.white)
            }
        }
        .alert("ошибка", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage ?? "неизвестная ошибка")
        }
        .navigationTitle("авторизация")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Остальные методы без изменений
    private var formIsValid: Bool {
        !viewModel.isLoading && !email.isEmpty && !password.isEmpty
    }
    
    @ViewBuilder
    private func authField(title: String, text: Binding<String>, isSecure: Bool) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text("*")
                    .font(.title2)
                    .foregroundColor(accentColor)
            }
            
            if isSecure {
                SecureField("введите \(title.lowercased())", text: text)
            } else {
                TextField("введите \(title.lowercased())", text: text)
                    .keyboardType(title == "Почта" ? .emailAddress : .default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Divider()
                .background(Color.gray)
        }
        .padding(.bottom, 16)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
