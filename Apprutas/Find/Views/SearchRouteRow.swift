//
//  SearchRouteRow.swift
//  Apprutas
//
//  Created by Дарья Любивая on 28.03.2025.
//

import SwiftUI

struct SearchRouteRow: View {
    let route: Route // Заменили TrailModel на Route
    
    var body: some View {
        NavigationLink(destination: TrailDetailsView(route: route)) {
            VStack(alignment: .leading) {
                Text(route.title)
                    .font(.headline)
                    .foregroundColor(.black)

                HStack {
                    Text(route.city)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text(route.fandom.name)
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
