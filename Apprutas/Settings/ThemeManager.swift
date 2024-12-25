//
//  ThemeManager.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

class ThemeManager: ObservableObject {
    @AppStorage("selectedTheme") var selectedTheme: String = "light" {
        didSet {
            switch selectedTheme {
            case "light":
                currentTheme = Themes.light
            case "dark":
                currentTheme = Themes.dark
            case "gray":
                currentTheme = Themes.gray
            default:
                currentTheme = Themes.light
            }
        }
    }
    @Published var currentTheme: Theme = Themes.light
    init() {
        switch selectedTheme {
        case "light":
            currentTheme = Themes.light
        case "dark":
            currentTheme = Themes.dark
        case "gray":
            currentTheme = Themes.gray
        default:
            currentTheme = Themes.light
        }
    }
}
