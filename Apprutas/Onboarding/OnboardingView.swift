//
//  OnboardingView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct OnboardingView: View {
    var data: OnboardingData
    var body: some View {
        VStack {
            Text(data.title).font(.largeTitle)
                .multilineTextAlignment(.center)
            Text(data.description).font(.body)
                .multilineTextAlignment(.center)
                .padding(5)
        }
        
    }
}
