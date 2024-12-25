//
//  SettingsView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Хранит состояние темы

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Вид")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Темная тема")
                    }
                    .onChange(of: isDarkMode) { _ in
                        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                    }
                }
                
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
            }
            .navigationBarTitle("Настройки", displayMode: .inline)
        }
    }
}

#Preview {
    SettingsView()
}
