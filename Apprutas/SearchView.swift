//
//  SearchView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 20.05.2025.
//

// SearchView.swift
import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) { // Выравниваем по левому краю
                // 1. Заголовок
                Text("поиск")
                    .font(.largeTitle) // Большой заголовок
                    .fontWeight(.bold) // Жирный шрифт

                // 2. Поисковая строка
                SearchBar(text: $searchText, placeholder: "поиск маршрутов") // Изменен placeholder
                    .onChange(of: searchText) { newValue in
                        viewModel.search(query: newValue)
                    }

                // 3. Состояния экрана
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else if searchText.isEmpty {
                    // Популярные фандомы в виде списка
                    List {
                        ForEach(viewModel.popularFandoms, id: \.self) { fandom in
                            Button(action: { searchText = fandom }) {
                                Text(fandom)
                                    .padding(.vertical, 8)
                                    .frame(maxWidth: .infinity, alignment: .leading) // Растягиваем кнопку на всю ширину
                                    .foregroundColor(.black) // Черный цвет текста
                                    .underline() // Подчеркивание
                            }
                            .listRowSeparator(.hidden) // Скрываем разделители строк
                            .listRowInsets(EdgeInsets()) // Убираем отступы у строк
                        }
                    }
                    .listStyle(.plain) // Убираем стиль списка
                } else {
                    SearchResultsView(routes: viewModel.searchResults)
                }
                Spacer() // Прижимаем контент к верху
            }
            .padding()
            .navigationBarHidden(true) // Скрываем стандартный navigationBar
        }
    }
}


// Под-компоненты для читаемости

struct SearchResultsView: View {
    let routes: [Route]

    var body: some View {
        List(routes) { route in
            NavigationLink(destination: RouteDetailView(route: route)) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(route.title)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(route.fandom.name)
                        .font(.headline)
                }
            }
        }
        .listStyle(.plain)
    }
}

extension URL {

    func appending(_ queryItem: String, value: String?) -> URL {

        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        return urlComponents.url!
    }
}
