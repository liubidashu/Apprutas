//
//  RouteListViewModel.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.
//

import SwiftUI
import Combine

class RouteListViewModel: ObservableObject {
    @Published var routes: [Route] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()

    func loadRoutes() {
        isLoading = true
        errorMessage = nil

        
        guard let url = URL(string: "http://localhost:3000/api/v1/trails") else {
            errorMessage = "Неверный URL"
            isLoading = false
            return
        }

    
        URLSession.shared.dataTaskPublisher(for: url)
            
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            
            .decode(type: [Route].self, decoder: JSONDecoder())

            .receive(on: DispatchQueue.main)
         
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { receivedRoutes in
                self.routes = receivedRoutes
            })
            .store(in: &cancellables)
    }
}
