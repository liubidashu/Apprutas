//
//  Endpoint.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.
//

protocol Endpoint {
    var compositePath: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var parameters: [String: String]? {
        nil
    }
}
