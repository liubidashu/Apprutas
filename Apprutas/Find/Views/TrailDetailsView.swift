//
//  RouteDetailView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 28.03.2025.
//

import SwiftUI

struct TrailDetailsView: View {
    let route: Route // Заменили TrailModel на Route
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(route.title)
                .font(.largeTitle)
            
            Text("Город: \(route.city)")
                .font(.headline)
            
            Text("Фандом: \(route.fandom.name)")
                .font(.subheadline)
            
            Text(route.body ?? "")
                .font(.body)
        }
        .padding()
        .navigationTitle(route.title)
    }
}
