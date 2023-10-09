//
//  MainTabViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation

class MainTabViewModel: ObservableObject {
    func logout() {
        UserService.shared.logout()
    }
}
