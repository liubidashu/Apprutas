//
//  TrailCard.swift
//  Apprutas
//
//  Created by Дарья Любивая on 28.03.2025.
//

import SwiftUI

struct TrailCardView: View {
    let trail: Route // Заменили TrailModel на Route
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(trail.title)
                .font(.headline)
            
            Text("\(trail.city), уровень: \(trail.trail_level)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(trail.body ?? "")
                .lineLimit(2)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8) // Исправлено
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}
