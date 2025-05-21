//
//  Route.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.
//

//import SwiftUI
//
//struct Route: Identifiable, Decodable {
//    let id: Int
//    let title: String
//    let city: String
//    let trail_time: String
//    let trail_level: String
//    let fandom: Fandom
// 
//
//    let body: String?
//    let url: String? 
//    enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case city
//        case trail_time
//        case trail_level
//        case fandom
//       
//
//        case body
//        case url
//    }
//}
//
//struct Fandom: Identifiable, Decodable {
//    let id: Int
//    let name: String
//    let description: String
//    let created_at: String?
//    let updated_at: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case description
//        case created_at
//        case updated_at
//    }
//}
//
//
import Foundation

// MARK: - RouteElement
struct Route: Identifiable, Codable {
    let id: Int
    let title, body: String
    let duration, distance: Int
    let difficulty: Difficulty
    let averageRating: Double
    let commentsCount: Int
    let fandom: Fandom
    let trailPoints: [TrailPoint]

    enum CodingKeys: String, CodingKey {
        case id, title, body, duration, distance, difficulty
        case averageRating = "average_rating"
        case commentsCount = "comments_count"
        case fandom
        case trailPoints = "trail_points"
    }
}

enum Difficulty: String, Codable {
    case легкий = "легкий"
    case сложный = "сложный"
    case средний = "средний"
}

// MARK: - Fandom
struct Fandom: Codable {
    let id: Int
    let name: String
}

// MARK: - TrailPoint
struct TrailPoint: Codable {
    let id: Int
    let name: String
    let mapLink: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case mapLink = "map_link"
    }
}


