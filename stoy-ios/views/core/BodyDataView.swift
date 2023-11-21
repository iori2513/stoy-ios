//
//  DataView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/11/18.
//

import SwiftUI

struct BodyDataView: View {
    @StateObject private var viewModel = BodyDataViewModel()

    var body: some View {
        Button(action: { Task { await viewModel.addBodyData() } }, label: {
            Text("Button")

        })
    }
}

#Preview {
    BodyDataView()
}
