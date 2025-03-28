//
//  FandomDetailsView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 28.03.2025.
//

import SwiftUI

struct FandomDetailsView: View {
    let fandom: Fandom // Заменили FandomModel на Fandom
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fandom.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(fandom.description)
                .font(.body)
                .padding(.top)
            
            Spacer()
        }
        .padding()
        .navigationTitle(fandom.name)
    }
}
