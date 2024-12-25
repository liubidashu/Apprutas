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
        VStack {
            Text("Вход в аккаунт")
                .font(.largeTitle)
                .padding(.bottom, 40)
            TextField("никнейм", text: $username)
                .padding()
                .background(Color(.log))
                .cornerRadius(100.0)
                .padding(10)
            
            SecureField("пароль", text: $password)
                .padding()
                .background(Color(.log))
                .cornerRadius(100.0)
                .padding(10)
            
            Button(action: {
            print("Button tapped")
            }) 
            
            {
                Text ("войти")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 171, height: 45)
                    .background(Color.but)
                    .cornerRadius(100.0)
            }
            .padding()
        }
    }
}
#Preview {
    LoginView()
}
