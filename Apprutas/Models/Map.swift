//
//  Trailname.swift
//  Apprutas
//
//  Created by Дарья Любивая on 25.12.2024.
//

import Foundation
struct Map: Decodable {
    let title: String
    let name: String
    let city: String
    let image: String
    let id: String
}

struct MapResponse: Decodable {
    let results: [Map]
}
