//
//  ApprutasApp.swift
//  Apprutas
//
//  Created by Дарья Любивая on 25.12.2024.
//

import SwiftUI

@main
struct ApprutasApp: App {
    // 1. Добавляем ViewModel (не влияет на существующий код)
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            // 2. Оставляем ваш SplashScreen как есть
            SplashScreenView()
                // 3. Добавляем ViewModel в окружение (не ломает SplashScreen)
                .environmentObject(authViewModel)
        }
    }
}
