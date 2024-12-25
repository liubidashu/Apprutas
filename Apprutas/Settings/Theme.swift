//
//  Theme.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct Theme {
    var backgroundColor: Color
    var textColor: Color
    var buttonColor: Color
    var buttonTextColor: Color
}

struct Themes {
    static let light = Theme(
        backgroundColor: Color.white,
        textColor: Color.black,
        buttonColor: Color.but,
        buttonTextColor: Color.white
    )
    static let dark = Theme(
        backgroundColor: Color.black,
        textColor: Color.white,
        buttonColor: Color.white,
        buttonTextColor: Color.black
    )
    static let gray = Theme(
        backgroundColor: Color.gray.opacity(0.1),
        textColor: Color.gray,
        buttonColor: Color.gray,
        buttonTextColor: Color.white
    )
}
