//
//  SearchViewModel.swift
//  Apprutas
//
//  Created by Дарья Любивая on 20.05.2025.
//

// SearchViewModel.swift
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchResults: [Route] = []
    @Published var popularFandoms: [String] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let decoder = JSONDecoder()
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadPopularFandoms()
    }

    // Загрузка популярных фандомов с API
    func loadPopularFandoms() {
        isLoading = true
        errorMessage = nil

        // Замените URL на актуальный endpoint для получения списка фандомов
        guard let url = URL(string: "http://localhost:3000/api/v1/fandoms") else {
            errorMessage = "Неверный URL для фандомов"
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
                let result = try decoder.decode(Search.Fandoms.self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.popularFandoms = result.fandoms.map { $0.name }
                }
            } catch(let error) {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription + "наша ошибка"
                }
            }
        }.resume()
    }

    // Поиск маршрутов через API
    func search(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            return
        }
print(query)
        isLoading = true
        errorMessage = nil

        //  Адаптированный код из RouteListViewModel
        //  Используем query для поиска маршрутов по названию фандома
        guard var url = URL(string: "http://localhost:3000/api/v1/trails?fandom=\(query)") else { // Изменили параметр search на fandom
            errorMessage = "Неверный URL"
            isLoading = false
            return
        }
        

        var request = URLRequest(url: url.appending("fandom", value: query))
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
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
                    self.searchResults = result
                }
            } catch(let error) {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription + "наша ошибка"
                }
            }
        }.resume()

//        URLSession.shared.dataTaskPublisher(for: url)
//            .tryMap { (data, response) -> Data in
//                guard let httpResponse = response as? HTTPURLResponse,
//                      (200...299).contains(httpResponse.statusCode) else {
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
//            .decode(type: [Route].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                self.isLoading = false
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    self.errorMessage = error.localizedDescription
//                }
//            }, receiveValue: { receivedRoutes in
//                self.searchResults = receivedRoutes
//            })
//            .store(in: &cancellables)
    }
}
