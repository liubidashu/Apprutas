//
//  RouteRow.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.
//

import SwiftUI

struct RouteRow: View {
    let route: Route

    var body: some View {
        NavigationLink(destination: RouteDetailView(route: route)) { 
            VStack(alignment: .leading) {
                Text(route.title) // Название маршрута
                    .font(.headline)
                    .foregroundColor(.black)

                HStack {
//                    Text(route.)  // Город
//                        .font(.subheadline)
//                        .foregroundColor(.gray)

                    Text(route.fandom.name) // Название фандома
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 2)

                Divider()
            }
            .padding()
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
