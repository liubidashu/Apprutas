//
//  SettingsView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Хранит состояние темы
    @StateObject private var viewModel = AuthViewModel() // Для работы с аутентификацией
    @State private var showAlert = false // Для подтверждения удаления
    
    var body: some View {
        NavigationView {
            ZStack {
                // Основной контент настроек
                if viewModel.shouldShowRegistrationView {
                    RegistrationView() // Показываем экран регистрации
                } else {
                    settingsContent
                }
            }
            .navigationBarTitle("Настройки", displayMode: .inline)
        }
    }
    
    // Выносим основной контент в отдельную переменную
    private var settingsContent: some View {
        Form {
            // Секция для настройки темы
            Section(header: Text("Вид")) {
                Toggle(isOn: $isDarkMode) {
                    Text("Темная тема")
                }
                .onChange(of: isDarkMode) { _ in
                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                }
            }
            
            // Секция с информацией
            Section(header: Text("Информация")) {
                HStack {
                    Text("Создатели")
                    Spacer()
                    Text("ходильщики - бродильщики")
                }
                HStack {
                    Text("Обратная связь")
                    Spacer()
                    Text("rutas@mail.com")
                }
                HStack {
                    Text("Версия")
                    Spacer()
                    Text("1.0.0")
                }
            }
            
            // Секция для управления аккаунтом
            Section(header: Text("Аккаунт")) {
                Button(role: .destructive) {
                    viewModel.signOut()
                } label: {
                    Text("Выйти")
                        .foregroundColor(.blue)
                }
                Button(role: .destructive) {
                    showAlert = true // Показываем предупреждение
                } label: {
                    Text("Удалить аккаунт")
                        .foregroundColor(.red)
                }
            }
        }
        .alert("Вы уверены?", isPresented: $showAlert) {
            Button("Отмена", role: .cancel) {}
            Button("Удалить", role: .destructive) {
                viewModel.deleteAccount { success in
                    if success {
                        print("[Settings] Аккаунт удален")
                    } else {
                        print("[Settings] Не удалось удалить аккаунт")
                    }
                }
            }
        } message: {
            Text("Это действие нельзя отменить. Все данные будут удалены.")
        }
    }
}

#Preview {
    SettingsView()
}
