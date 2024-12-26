//
//  TrailService.swift
//  Apprutas
//
//  Created by Дарья Любивая on 26.12.2024.
//

import Foundation
enum TrailError: Error {
    case urlError
}

class TrailService {
    func fetchTrails()async -> Result<TrailResponse, Error> {
        guard let url = URL(string: "http://localhost:3000/api/v1/trails") else {
            return .failure(TrailError.urlError)
        }
        
        do {
            let (data, responce) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(TrailResponse.self, from: data)
            print(decoded.resalts.first?.name)
            return .success(decoded)
        } catch {
            return Result.failure(error)
        }
        
       
        
    }
}
