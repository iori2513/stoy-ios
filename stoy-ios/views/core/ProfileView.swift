//
//  ProfileView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/13.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("プロフィール")
            Button(action: UserService.shared.logout) {
                Text("ログアウト")
            }
        }
    }
}

#Preview {
    ProfileView()
}
