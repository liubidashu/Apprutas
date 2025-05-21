//
//  User.swift
//  Apprutas
//
//  Created by Дарья Любивая on 21.05.2025.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let userId: Int?
    let name: String?
    let bio: String?
    let avatar: Avatar?
    let city: String? // Объявляем city как optional String
    let nickname: String
    let link: String?
    let fandomNames: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case name
        case bio
        case avatar
        case city
        case nickname
        case link
        case fandomNames = "fandom_names"
    }

    var fandomList: [String] {
        guard let fandomNames = fandomNames,
              let data = fandomNames.data(using: .utf8),
              let fandoms = try? JSONSerialization.jsonObject(with: data, options: []) as? [String] else {
            return []
        }
        return fandoms
    }
}

struct Avatar: Decodable {
    let url: String?
}
