//
//  ContentView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                
                VStack {
                    
                    
                    NavigationLink(destination: MenuContentView() ){
                        Image("glav")
                            .resizable()
                            .scaledToFill()
                        .edgesIgnoringSafeArea(.all)}

                        

                            

                        

                    
                    
                    
                    
                    
                    Image("perv")
                        .resizable()
                        .padding(20)
                    
                    NavigationLink(destination: TrailsView() ) {
                        Image("yuo")
                            .resizable()
                        .padding(20)}
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
            }
            .ignoresSafeArea()
        }
        
        

        }
    
    
    
    
    
    }


#Preview {
    ContentView()
}
