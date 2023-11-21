//
//  MainTabView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import SwiftUI

struct MainTabView: View {

    @StateObject private var viewModel = MainTabViewModel()

    var body: some View {
        TabView(selection: $viewModel.tabIndex) {
            PostView()
                .tabItem {
                    Label("投稿", systemImage: "house")
                }
                .tag(MainTabViewIndex.post)
            DietView()
                .tabItem {
                    Label("食事", systemImage: "fork.knife")
                }
                .tag(MainTabViewIndex.diet)
            ProfileView()
                .tabItem {
                    Label("プロフィール", systemImage: "person")
                }
                .tag(MainTabViewIndex.profile)
            BodyDataView()
                .tabItem {
                    Label("体重管理", systemImage: "figure.mixed.cardio")
                }
                .tag(MainTabViewIndex.profile)
        }
    }
}

#Preview {
    MainTabView()
}
