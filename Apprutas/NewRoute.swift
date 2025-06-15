//
//  NewRoute.swift
//  Apprutas
//
//  Created by Дарья Любивая on 14.06.2025.
//

//import Foundation
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
//
//// Enum для сложности маршрута
//enum Difficulty: String, CaseIterable {
//    case easy = "easy"
//    case medium = "medium"
//    case hard = "hard"
//
//    var localizedString: String {
//        switch self {
//        case .easy:
//            return NSLocalizedString("Легкий", comment: "Easy difficulty")
//        case .medium:
//            return NSLocalizedString("Средний", comment: "Medium difficulty")
//        case .hard:
//            return NSLocalizedString("Сложный", comment: "Hard difficulty")
//        }
//    }
//}
