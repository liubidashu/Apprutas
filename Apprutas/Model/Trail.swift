//
//  Trail.swift
//  Apprutas
//
//  Created by Дарья Любивая on 26.12.2024.
//

import Foundation

struct Trail: Decodable {
    let id: Int
    let title: String
    let name: String
    let city: String
}


struct TrailResponse: Decodable  {
    let resalts: [Trail]
}
