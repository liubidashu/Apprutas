//
//  FandomSearchModel.swift
//  Apprutas
//
//  Created by Дарья Любивая on 21.05.2025.
//

import Foundation

enum Search {
    // MARK: - Fandoms
    struct Fandoms: Codable {
        let fandoms: [Fandom]
    }

    // MARK: - Fandom
    struct Fandom: Identifiable, Codable {
        let id: Int
        let name: String
        let trails: [Trail]
    }

    // MARK: - Trail
    struct Trail: Codable {
        let id: Int
        let title, body: String
        let duration, distance: Int
        let difficulty: Difficulty
        let averageRating: Double
        let commentsCount, likesCount: Int

        enum CodingKeys: String, CodingKey {
            case id, title, body, duration, distance, difficulty
            case averageRating = "average_rating"
            case commentsCount = "comments_count"
            case likesCount = "likes_count"
        }
    }

    enum Difficulty: String, Codable {
        case легкий = "легкий"
        case сложный = "сложный"
        case средний = "средний"
    }
}
