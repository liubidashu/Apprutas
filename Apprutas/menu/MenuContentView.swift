//
//  MenuContentView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 26.12.2024.
//

import SwiftUI

struct MenuContentView: View {
    var body: some View {
        NavigationView {
            
            
            VStack {
                HStack{
                    Rectangle ()
                        .frame(width: 270, height: 80)
                        .foregroundStyle(.clear)
                    
                    NavigationLink(destination: ContentView() ) {
                        Image("nop")
                            .resizable()
                            .frame(width: 33, height: 33)
                    }
                    
                }
                
                
                
                Image("logo")
                    .resizable()
                    .frame(width: 354, height: 134)
                HStack {
                    Image("loop")
                        .resizable()
                        .frame(width: 308, height: 35)
                    
                    NavigationLink(destination: ProfileView() ) {
                        Image("pro")
                            .resizable()
                            .frame(width: 23, height: 26)
                            .padding(3)
                    }
                    
                    
                    
                }
                Rectangle ()
                    .frame(width: 90, height: 40)
                    .foregroundStyle(.clear)
                NavigationLink(destination: ContentView() ){
                    Text("главная")
                        .padding(20)
                        .font(.title3)
                }
                Text("фандомы")
                    .padding(20)
                    .font(.title3)
                Text("сообщество")
                    .padding(20)
                    .font(.title3)
                Text("уведомления")
                    .padding(20)
                    .font(.title3)
                Text("чаты")
                    .padding(20)
                    .font(.title3)
                
            }
        }
        
    }
}

#Preview {
    MenuContentView()
}
