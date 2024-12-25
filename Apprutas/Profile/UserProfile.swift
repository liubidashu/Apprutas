//
//  UserProfile.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct UserProfile: Identifiable {
    var id = UUID()
    var firstName: String
    var email: String
    var avatar: UIImage?
}
