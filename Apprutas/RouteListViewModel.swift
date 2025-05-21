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

    private let decoder = JSONDecoder()
    private var cancellables = Set<AnyCancellable>()

    func loadRoutes() {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "http://localhost:3000/api/v1/trails") else {
            errorMessage = "Неверный URL"
            isLoading = false
            return
        }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            guard let self else { return }
            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode),
                let data
            else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = URLError(.badServerResponse).localizedDescription
                }
                return
            }

            do {
                let result = try decoder.decode([Route].self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.routes = result
                }
            } catch(let error) {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription + "наша ошибка"
                }
            }
        }.resume()
    }
}
