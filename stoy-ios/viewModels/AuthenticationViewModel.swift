//
//  AuthenticationViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/19.
//

import Foundation
import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var state: ViewState = ViewState.logIn

    func changeView() {
        switch state {
        case .logIn:
            self.state = .signUp
        case .signUp:
            self.state = .logIn
        }
    }

    enum ViewState {
        case logIn
        case signUp

        var btnText: String {
            switch self {
            case .logIn:
                return "アカウント作成"
            case .signUp:
                return "ログイン画面へ"
            }
        }
    }
}
