//
//  ContentView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/16.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        ZStack {
            Group {
                if viewModel.user == nil {
                    AuthenticationView()
                } else {
                    MainTabView()
                }
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

#Preview {
    ContentView()
}
