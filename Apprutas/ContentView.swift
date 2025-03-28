//
//  ContentView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: RouteListViewModel

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Загрузка...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Ошибка: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List {
                        ForEach(viewModel.routes) { route in
                            RouteRow(route: route)
                                .listRowSeparator(.hidden)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                    .listStyle(.plain)
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Маршруты")
            .onAppear {
                viewModel.loadRoutes() 
            }
        }
    }
}

#Preview {
    ContentView(viewModel: RouteListViewModel())
}
