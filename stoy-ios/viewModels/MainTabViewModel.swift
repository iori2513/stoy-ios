//
//  MainTabViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation

class MainTabViewModel: ObservableObject {

    @Published var tabIndex: MainTabViewIndex = .post

    func logout() {
        UserService.shared.logout()
    }
}

enum MainTabViewIndex: Int {
    case post = 1
    case diet = 2
    case profile = 3
}
