//
//  ContentView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    init() {
        AppConfig.setupEnv()
    }
}

#Preview {
    ContentView()
}
