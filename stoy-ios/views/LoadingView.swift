//
//  LoadingView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.6)
            ProgressView()

        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LoadingView()
}
