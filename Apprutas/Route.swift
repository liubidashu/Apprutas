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

//Рабочий

//import Foundation
//
//// MARK: - RouteElement
//struct Route: Identifiable, Codable {
//    let id: Int
//    let title, body: String
//    let duration, distance: Int
//    let difficulty: Difficulty
//    let averageRating: Double
//    let commentsCount: Int
//    let fandom: Fandom
//    let trailPoints: [TrailPoint]
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, body, duration, distance, difficulty
//        case averageRating = "average_rating"
//        case commentsCount = "comments_count"
//        case fandom
//        case trailPoints = "trail_points"
//    }
//}
//
//enum Difficulty: String, Codable {
//    case легкий = "легкий"
//    case сложный = "сложный"
//    case средний = "средний"
//}
//
//// MARK: - Fandom
//struct Fandom: Codable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - TrailPoint
//struct TrailPoint: Codable {
//    let id: Int
//    let name: String
//    let mapLink: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case mapLink = "map_link"
//    }
//}

//Конец


//Начало нового


//import Foundation
//
//// MARK: - RouteElement
//struct Route: Identifiable, Codable {
//    let id: Int
//    let title, body: String
//    let duration, distance: Int
//    let difficulty: Difficulty
//    let averageRating: Double
//    let commentsCount: Int
//    let fandom: Fandom
//    let trailPoints: [TrailPoint]
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, body, duration, distance, difficulty
//        case averageRating = "average_rating"
//        case commentsCount = "comments_count"
//        case fandom
//        case trailPoints = "trail_points"
//    }
//}
//
//// MARK: - Fandom
//struct Fandom: Codable, Identifiable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - TrailPoint
//struct TrailPoint: Codable, Identifiable {
//    let id: Int
//    let name: String
//    let mapLink: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case mapLink = "map_link"
//    }
//}
//
//// Enum для сложности маршрута
//enum Difficulty: String, Codable, CaseIterable {
//    case easy = "easy"
//    case medium = "medium"
//    case hard = "hard"
//    case легкий = "легкий"
//    case средний = "средний"
//    case сложный = "сложный"
//
//    var localizedString: String {
//        switch self {
//        case .easy, .легкий:
//            return NSLocalizedString("Легкий", comment: "Easy difficulty")
//        case .medium, .средний:
//            return NSLocalizedString("Средний", comment: "Medium difficulty")
//        case .hard, .сложный:
//            return NSLocalizedString("Сложный", comment: "Hard difficulty")
//        }
//    }
//}
//
//// Модель для создания маршрута
//struct NewRoute {
//    var title: String = ""
//    var description: String = ""
//    var location: String = "" // Поле для локации (города)
//    var fandom: String = ""
//    var durationHours: Int = 0
//    var durationMinutes: Int = 0
//    var distanceMeters: Double = 0.0
//    var cost: Int = 0
//    var difficulty: Difficulty = .easy
//    var trailPoints: [NewTrailPoint] = [] // Используем новую модель для точек маршрута
//}
//
//// Модель для точек маршрута в процессе создания
//struct NewTrailPoint {
//    var photoURL: URL? // Фото точки
//    var name: String = "" // Название точки
//    var description: String = "" // Описание точки
//    var mapLink: String = "" // Ссылка на карту точки
//}

//конец нового

//начало супер-нового

//import Foundation
//
//// MARK: - RouteElement
//struct Route: Identifiable, Codable {
//    let id: Int
//    let title, body: String
//    let durationHours: Int // Часы
//    let durationMinutes: Int // Минуты
//    let distanceKm: Double // Километры
//    let distanceMeters: Double // Метры
//    let difficulty: Difficulty
//    let averageRating: Double
//    let commentsCount: Int
//    let fandom: Fandom
//    let trailPoints: [TrailPoint]
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, body
//        case durationHours = "duration_hours"
//        case durationMinutes = "duration_minutes"
//        case distanceKm = "distance_km"
//        case distanceMeters = "distance_meters"
//        case difficulty
//        case averageRating = "average_rating"
//        case commentsCount = "comments_count"
//        case fandom
//        case trailPoints = "trail_points"
//    }
//}
//
//// MARK: - Fandom
//struct Fandom: Codable, Identifiable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - TrailPoint
//struct TrailPoint: Codable, Identifiable {
//    let id: Int
//    let name: String
//    let mapLink: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case mapLink = "map_link"
//    }
//}
//
//// Enum для сложности маршрута
//enum Difficulty: String, Codable, CaseIterable {
//    case easy = "easy"
//    case medium = "medium"
//    case hard = "hard"
//    case легкий = "легкий"
//    case средний = "средний"
//    case сложный = "сложный"
//
//    var localizedString: String {
//        switch self {
//        case .easy, .легкий:
//            return NSLocalizedString("Легкий", comment: "Easy difficulty")
//        case .medium, .средний:
//            return NSLocalizedString("Средний", comment: "Medium difficulty")
//        case .hard, .сложный:
//            return NSLocalizedString("Сложный", comment: "Hard difficulty")
//        }
//    }
//}
//
//// Модель для создания маршрута
//struct NewRoute {
//    var title: String = ""
//    var description: String = ""
//    var location: String = "" // Поле для локации (города)
//    var fandom: String = ""
//    var durationHours: Int = 0 // Часы
//    var durationMinutes: Int = 0 // Минуты
//    var distanceKm: Double = 0.0 // Километры
//    var distanceMeters: Double = 0.0 // Метры
//    var cost: Int = 0
//    var difficulty: Difficulty = .easy
//    var trailPoints: [NewTrailPoint] = [] // Используем новую модель для точек маршрута
//}
//
//// Модель для точек маршрута в процессе создания
//struct NewTrailPoint {
//    var photoURL: URL? // Фото точки
//    var name: String = "" // Название точки
//    var description: String = "" // Описание точки
//    var mapLink: String = "" // Ссылка на карту точки
//}


// ещё раз новый
import Foundation

// MARK: - Route
struct Route: Identifiable, Codable {
    let id: Int
    let title: String
    let body: String
    
    // Старые поля (для текущего API)
    let duration: Int?    // в минутах
    let distance: Int?    // в метрах
    
    // Новые поля (для будущего API)
    let durationHours: Int?
    let durationMinutes: Int?
    let distanceKm: Double?
    let distanceMeters: Double?
    
    let difficulty: Difficulty
    let averageRating: Double
    let commentsCount: Int
    let fandom: Fandom
    let trailPoints: [TrailPoint]
    
    // Вычисляемые свойства для универсального доступа
    var durationInMinutes: Int {
        if let duration = duration {
            return duration
        } else if let hours = durationHours, let minutes = durationMinutes {
            return hours * 60 + minutes
        }
        return 0
    }
    
    var distanceInMeters: Int {
        if let distance = distance {
            return distance
        } else if let km = distanceKm, let meters = distanceMeters {
            return Int(km * 1000 + meters)
        }
        return 0
    }
    
    // Удобные свойства для UI
    var hours: Int { durationInMinutes / 60 }
    var minutes: Int { durationInMinutes % 60 }
    var kilometers: Double { Double(distanceInMeters) / 1000.0 }
    var meters: Double { Double(distanceInMeters) }

    enum CodingKeys: String, CodingKey {
        case id, title, body, duration, distance, difficulty
        case averageRating = "average_rating"
        case commentsCount = "comments_count"
        case fandom
        case trailPoints = "trail_points"
        case durationHours = "duration_hours"
        case durationMinutes = "duration_minutes"
        case distanceKm = "distance_km"
        case distanceMeters = "distance_meters"
    }
}

// MARK: - Fandom
struct Fandom: Codable, Identifiable {
    let id: Int
    let name: String
}

// MARK: - TrailPoint
struct TrailPoint: Codable, Identifiable {
    let id: Int
    let name: String
    let mapLink: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case mapLink = "map_link"
    }
}

// MARK: - Difficulty
enum Difficulty: String, Codable, CaseIterable {
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
    case легкий = "легкий"
    case средний = "средний"
    case сложный = "сложный"

    var localizedString: String {
        switch self {
        case .easy, .легкий:
            return NSLocalizedString("легкий", comment: "Easy difficulty")
        case .medium, .средний:
            return NSLocalizedString("средний", comment: "Medium difficulty")
        case .hard, .сложный:
            return NSLocalizedString("сложный", comment: "Hard difficulty")
        }
    }
}

// MARK: - NewRoute (для создания маршрута)
struct NewRoute {
    var title: String = ""
    var description: String = ""
    var location: String = ""
    var fandom: String = ""
    var durationHours: Int = 0
    var durationMinutes: Int = 0
    var distanceKm: Double = 0.0
    var distanceMeters: Double = 0.0
    var cost: Int = 0
    var difficulty: Difficulty = .easy
    var trailPoints: [NewTrailPoint] = []
    
    func toRoute() -> Route {
        Route(
            id: 0,
            title: title,
            body: description,
            duration: nil,
            distance: nil,
            durationHours: durationHours,
            durationMinutes: durationMinutes,
            distanceKm: distanceKm,
            distanceMeters: distanceMeters,
            difficulty: difficulty,
            averageRating: 0.0,
            commentsCount: 0,
            fandom: Fandom(id: 0, name: fandom),
            trailPoints: trailPoints.map {
                TrailPoint(id: 0, name: $0.name, mapLink: $0.mapLink)
            }
        )
    }
}

// MARK: - NewTrailPoint (для точек маршрута при создании)
struct NewTrailPoint {
    var photoURL: URL?
    var name: String = ""
    var description: String = ""
    var mapLink: String = ""
}
