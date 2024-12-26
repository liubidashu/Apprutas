//
//  LoginView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack {
            Image("fon")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                Text("привет!")
                    .font(.largeTitle)
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("авторизуйся, чтобы публиковать маршруты и участвовать в обсуждениях")
                    .font(.title3)
                    .padding(.bottom, 20)
                    .font(.body)
//                    .frame(width: 300, alignment: .leading)
                
                
                
                
                TextField("никнейм", text: $username)
                    .padding()
                    .background(Color(.asv))
                    .padding(10)
                    .font(.footnote)
                
                SecureField("пароль", text: $password)
                    .padding()
                    .background(Color(.asv))
                    .font(.footnote)
                
                    .padding(10)
                
                Button(action: {
                    print("Button tapped")
                }){
                    Text ("войти")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 171, height: 45)
                        .background(Color.asv)
                }
                .padding()
            }
            
        }
        
    }
}
#Preview {
    LoginView()
}
