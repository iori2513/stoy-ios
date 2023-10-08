//
//  AppStore.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation

class AppStore {
    //    public static let shared = AppStore()

    public static var token: String {
        get {
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "token")
        }
    }
}
