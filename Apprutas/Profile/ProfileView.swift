//
//  ProfileView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI
struct ProfileView: View {
    @State private var user: UserProfile = UserProfile(
        firstName: "Fairywander",
        email: "fairywander@mail.com",
        avatar: UIImage(named: "avatar_placeholder")
    )
    @State private var isEditing: Bool = false
    @State private var showSettings: Bool = false
    @State private var selectedImage: UIImage?
    var body: some View {
        NavigationView {
            VStack {
                if let avatar = user.avatar {
                    Image(uiImage: avatar)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                }
                Text(user.firstName)
                    .font(.largeTitle)
                    .padding(.top, 20)
                Text(user.email)
                    .font(.subheadline)
                    .padding(.top, 1)
                Spacer()
                
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text("изменить")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.but)
                        .cornerRadius(100)
                }
            }
            .sheet(isPresented: $isEditing) {
                EditProfileView(user: $user, selectedImage: $selectedImage)
            }
        
            .padding()
            .navigationBarTitle("Профиль", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showSettings.toggle()
            }) {
                Image(systemName: "gear")
            })
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
        
}
#Preview {
    ProfileView()
}
