//
//  CommunityView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 21.05.2025.
//

import SwiftUI
import Combine

struct CommunityView: View {
    @State private var searchText: String = ""
    @State private var users: [User] = []
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    @State private var cancellables = Set<AnyCancellable>()

    init(users: [User] = []) {
        self._users = State(initialValue: users)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Сообщество")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    // Поисковое окно
                    TextField("Поиск по городу или фандому", text: $searchText)
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.horizontal)
                        .onChange(of: searchText) { _ in
                            loadUsers()
                        }

                    // Карточки пользователей
                    if isLoading {
                        ProgressView()
                    } else if let errorMessage = errorMessage {
                        Text("Ошибка: \(errorMessage)")
                            .foregroundColor(.red)
                    } else {
                        ForEach(filteredUsers) { user in // Используем вычисляемое свойство
                            UserCardView(user: user)
                        }
                    }

                    Spacer()
                }
                .onAppear {
                    #if DEBUG // Проверяем, запущено ли приложение в режиме отладки
                    loadUsers()
                    #endif
                }
                .navigationBarHidden(true)
            }
        }
    }

    // Вычисляемое свойство для фильтрации пользователей
    private var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { user in
                let cityMatch = (user.city ?? "").localizedCaseInsensitiveContains(searchText)
                let fandomMatch = user.fandomList.contains { $0.localizedCaseInsensitiveContains(searchText) }
                return cityMatch || fandomMatch
            }
        }
    }

    func loadUsers() {
        isLoading = true
        errorMessage = nil

        var urlComponents = URLComponents(string: "http://localhost:3000/api/v1/profiles")!

        guard let url = urlComponents.url else {
            errorMessage = "Неверный URL"
            isLoading = false
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { (data: Data, response: URLResponse) -> Data in
                print("Полученные данные: \(String(data: data, encoding: .utf8) ?? "Невозможно отобразить данные")") // Добавляем распечатку данных
                return data
            }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    errorMessage = "Ошибка: \(error.localizedDescription)"
                    print("Ошибка декодирования: \(error)") // Добавляем распечатку ошибки
                }
            }, receiveValue: { fetchedUsers in
                users = fetchedUsers // Обновляем users напрямую
            })
            .store(in: &cancellables)
    }
}

// Пример моковых данных для превью
#if DEBUG
struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(users: [
            User(id: 1, userId: 1, name: "John Doe", bio: "Software Engineer", avatar: nil, city: "Moscow", nickname: "johndoe", link: nil, fandomNames: "[\"Swift\", \"iOS\"]"),
            User(id: 2, userId: 2, name: "Jane Smith", bio: "UI Designer", avatar: nil, city: "Saint Petersburg", nickname: "janesmith", link: nil, fandomNames: "[\"UI Design\", \"UX Design\"]")
        ])
    }
}
#endif
