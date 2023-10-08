//
//  SignUpViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""

    func register() async {
        do {
            GeneralService.shared.showPageLoading()
            try await UserService.shared.register(params: .init(email: email, username: username, password: password))
            try await UserService.shared.login(params: .init(email: email, password: password))
            GeneralService.shared.hidePageLoading()
        } catch {
            print(error)
        }
    }
}
