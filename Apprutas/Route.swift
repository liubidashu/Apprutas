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

struct Route: Identifiable, Codable {
    let id: Int
    let title: String
    let city: String
    let trail_time: String
    let trail_level: String
    let fandom: Fandom // Используем общий тип Fandom
    let body: String? // Опциональное поле
    let url: String?  // Опциональное поле
}

struct Fandom: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let created_at: String?
    let updated_at: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case created_at
        case updated_at
    }
}
