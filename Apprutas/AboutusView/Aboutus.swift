//
//  AboutusView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 26.12.2024.
//

import SwiftUI

struct AboutusView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                VStack {
                    
                    HStack{
                        Rectangle ()
                            .frame(width: 290, height: 30)
                            .foregroundStyle(.clear)

                            Image("nop")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .padding(20)
                        }
                    }
                    
                    Image("o1")
                        .resizable()
                    Image("o2")
                        .resizable()
                    Image("o3")
                        .resizable()
                    Image("o4")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .padding(10)
                    Image("o5")
                        .resizable()
                        .scaledToFill()
                    Image("o6")
                        .resizable()
                        .scaledToFill()
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
            }
        }
}

#Preview {
    AboutusView()
}
