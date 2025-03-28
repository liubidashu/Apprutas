//
//  TrailRow.swift
//  Apprutas
//
//  Created by Дарья Любивая on 28.03.2025.
//

import SwiftUI

struct TrailRow: View {
    let trail: Route
    
    var body: some View {
        NavigationLink(destination: TrailDetailsView(route: trail)) { // Заменили RouteDetailView на TrailDetailsView
            VStack(alignment: .leading) {
                Text(trail.title)
                    .font(.headline)
                    .foregroundColor(.black)

                HStack {
                    Text(trail.city)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text(trail.fandom.name)
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
