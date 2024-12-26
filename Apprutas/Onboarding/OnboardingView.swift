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
        
        
        ZStack {
            
            Image("wow")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            Text(data.title).font(.largeTitle)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
            Text(data.description).font(.body)
                .multilineTextAlignment(.leading)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.bottom, 5)
        
        
        
        
        }
        
    }
}
