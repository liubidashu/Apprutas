//
//  UserCardView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 21.05.2025.
//

import SwiftUI

struct UserCardView: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(user.name ?? "Unknown User")
                .font(.headline)

            Text("City: \(user.city ?? "Unknown City")") // Используем ?? для отображения "Unknown City", если city равно nil
                .font(.subheadline)

            Text("Fandoms: \(user.fandomList.joined(separator: ", "))")
                .font(.subheadline)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}
