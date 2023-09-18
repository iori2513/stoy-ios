//
//  stoy_iosApp.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/16.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
                     = nil) -> Bool {
        AppConfig.setupEnv()
        return true
    }
}

@main
struct stoy_iosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
