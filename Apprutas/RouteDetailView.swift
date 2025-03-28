//
//  RouteDetailView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.
//
import SwiftUI

struct RouteDetailView: View {
    let route: Route // Используем тип Route вместо TrailModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Название: \(route.title)")
                .font(.title)
            
            Text("Фандом: \(route.fandom.name)")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Город: \(route.city)")
                .font(.subheadline)
            
            if let body = route.body {
                Text(body)
                    .padding(.top)
            }
        }
        .padding()
        .navigationTitle(route.title)
    }
}
