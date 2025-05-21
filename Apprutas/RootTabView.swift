
//  MainTabView.swift
//  Apprutas
//
//  Created by Дарья Любивая on 04.03.2025.


import SwiftUI

struct RootTabView: View {
    @State private var selectedTab = 0
    let vm = RouteListViewModel()

    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView(viewModel: vm)
                .tabItem {
                    Image(selectedTab == 0 ? "home_icon_active" : "home_icon_inactive") 
                }
                .tag(0) 

            CommunityView()
                .tabItem {
                    Image(selectedTab == 1 ? "fandom_icon_active" : "fandom_icon_inactive")
                }
                .tag(1)

            NewtrailView()
                .tabItem {
                    Image(selectedTab == 2 ? "newtrail_icon_active" : "newtrail_icon_inactive")
                }
                .tag(2)

            ProfileView()
                .tabItem {
                    Image(selectedTab == 3 ? "profile_icon_active" : "profile_icon_inactive")
                }
                .tag(3)

            SearchView()
                .tabItem {
                    Image(selectedTab == 4 ? "search_icon_active" : "search_icon_inactive")
                }
                .tag(4)
        }
    }
}

#Preview {
    RootTabView()
}
