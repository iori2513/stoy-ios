//
//  AppStore.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation

// UserDefaults関連のもの
class AppStore {
    public static var token: String {
        get {
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "token")
        }
    }
}
