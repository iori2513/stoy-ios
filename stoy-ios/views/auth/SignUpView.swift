//
//  SignUpView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import SwiftUI

struct SignUpView: View {

    @StateObject private var viewModel = SignUpViewModel()

    var body: some View {
        VStack {
            Text("新規登録")
                .font(.title)

            Spacer()
                .frame(height: 30)

            VStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("メールアドレス")
                    TextField("", text: $viewModel.email)
                        .frame(height: 35)
                        .border(Color.gray)
                        .textInputAutocapitalization(.never)
                }
                VStack(alignment: .leading) {
                    Text("ユーザー名")
                    TextField("", text: $viewModel.username)
                        .frame(height: 35)
                        .border(Color.gray)
                        .textInputAutocapitalization(.never)
                }
                VStack(alignment: .leading) {
                    Text("パスワード")
                    TextField("", text: $viewModel.password)
                        .frame(height: 35)
                        .border(Color.gray)
                        .textInputAutocapitalization(.never)
                }
            }
            .padding(.horizontal, 20)

            Spacer()
                .frame(height: 30)

            Button(action: { Task { await viewModel.register() } }, label: {
                Text("OK")
                    .frame(width: 230, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
        }

    }
}

#Preview {
    SignUpView()
}
