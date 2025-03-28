//
//  SplashScreenView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var isActive = false
    @State private var splashDone = false
    
    private let minSplashDuration: Double = 2.0
    
    var body: some View {
        Group {
            if isActive {
                if authViewModel.isAuthenticated {
                    RootTabView()
                } else {
                    AuthView()
                }
            } else {
                // Оригинальный splash screen (без изменений)
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Image("splash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 396, height: 855)
                    }
                }
            }
        }
        .onAppear {
            // 1. Запускаем таймер минимального времени показа
            DispatchQueue.main.asyncAfter(deadline: .now() + minSplashDuration) {
                splashDone = true
                tryToProceed()
            }
            
            // 2. Проверяем аутентификацию (используем только существующие методы)
            checkAuthStatus()
        }
    }
    
    // MARK: - Методы (без изменений в AuthViewModel)
    
    private func checkAuthStatus() {
        // Только проверка локального токена без вызова validateToken
        authViewModel.isAuthenticated = UserDefaults.standard.string(forKey: "authToken") != nil
        
        // Если нужно "разлогинить" при невалидном токене, добавьте:
        // authViewModel.signOut() // Используем существующий метод
    }
    
    private func tryToProceed() {
        // Переход после минимального времени загрузки
        if splashDone {
            proceedToApp()
        }
    }
    
    private func proceedToApp() {
        withAnimation {
            isActive = true
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .environmentObject(AuthViewModel())
    }
}
