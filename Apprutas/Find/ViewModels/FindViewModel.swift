//
//  FindViewModel.swift
//  Apprutas
//
//  Created by Дарья Любивая on 28.03.2025.
//

import Foundation
import Combine

class FindViewModel: ObservableObject {
    @Published var fandoms: [Fandom] = []
    @Published var routes: [Route] = []
    @Published var searchQuery: String = ""
    @Published var filteredFandoms: [Fandom] = []
    @Published var filteredRoutes: [Route] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let baseURL = "http://localhost:3000/api/v1"
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Инициализация
    init() {
        setupBindings()
        loadFandoms()
        loadRoutes()
    }
    
    // MARK: - Настройка реактивных связей
    private func setupBindings() {
        $searchQuery
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.filterData()
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Загрузка фандомов
    func loadFandoms() {
        isLoading = true
        guard let url = URL(string: "\(baseURL)/fandoms") else {
            handleError("Неверный URL для загрузки фандомов")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [Fandom].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.handleError("Ошибка загрузки фандомов: \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] fandoms in
                    self?.fandoms = fandoms
                    self?.filteredFandoms = fandoms
                }
            )
            .store(in: &cancellables)
    }
    
    // MARK: - Загрузка маршрутов
    func loadRoutes() {
        isLoading = true
        guard let url = URL(string: "\(baseURL)/routes") else {
            handleError("Неверный URL для загрузки маршрутов")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [Route].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.handleError("Ошибка загрузки маршрутов: \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] routes in
                    self?.routes = routes
                    self?.filteredRoutes = routes
                }
            )
            .store(in: &cancellables)
    }
    
    // MARK: - Фильтрация данных
    func filterData() {
        filteredFandoms = fandoms.filter {
            $0.name.localizedCaseInsensitiveContains(searchQuery)
        }
        
        filteredRoutes = routes.filter {
            $0.title.localizedCaseInsensitiveContains(searchQuery) ||
            $0.fandom.name.localizedCaseInsensitiveContains(searchQuery) ||
            ($0.body?.localizedCaseInsensitiveContains(searchQuery) ?? false)
        }
    }
    
    // MARK: - Обработка ошибок
    private func handleError(_ message: String) {
        errorMessage = message
        isLoading = false
        print("Ошибка: \(message)")
    }
}
