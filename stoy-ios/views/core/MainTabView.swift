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
        Button(action: { viewModel.logout() }, label: {
            Text("ログアウト")
        })
    }
}

#Preview {
    MainTabView()
}
