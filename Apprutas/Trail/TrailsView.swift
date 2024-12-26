//
//  TrailsView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 26.12.2024.
//

import SwiftUI

struct TrailsView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                VStack{
                    
                    HStack{
                        Rectangle ()
                            .frame(width: 290, height: 30)
                            .foregroundStyle(.clear)
                        NavigationLink(destination: ContentView() ){
                            Image("nop")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .padding(20)
                        }
                    }
                    
                    
                    Image("t1")
                        .resizable()
                        .padding(10)
                    Image("t2")
                        .resizable()
                        .padding(10)
                    Image("t3")
                        .resizable()
                        .padding(10)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
                
            }
        }
        
    }
}

#Preview {
    TrailsView()
}
