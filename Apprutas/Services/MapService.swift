//
//  RutasService.swift
//  Apprutas
//
//  Created by Дарья Любивая on 25.12.2024.
//

import Foundation

enum MapError: Error {
    case urlError
}



class MapService {
    
    func fetchMaps() async -> Result<MapResponse, Error> {
        guard let url = URL(string: "http://localhost:3000/api/v1/trails") else {
            return .failure(MapError.urlError)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(MapResponse.self, from: data)
            print(decoded.results.first?.name)
            return .success(decoded)
            
        } catch {
            return .failure(error)
        }
       
        
        
    }
}
