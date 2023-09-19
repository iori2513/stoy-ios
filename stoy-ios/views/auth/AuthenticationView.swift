//
//  AuthenticationView.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/19.
//

import SwiftUI

struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    
    var body: some View {
        switch viewModel.state {
            case .logIn:
                LogInView()
            case .signUp:
                SignUpView()
        }
        Spacer().frame(height: 30)
        Button(action: { viewModel.changeView() }, label: {
            Text(viewModel.state.btnText)
                .animation(.none)
        })
    }
}

#Preview {
    AuthenticationView()
}
