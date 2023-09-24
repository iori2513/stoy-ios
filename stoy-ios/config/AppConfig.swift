//
//  AppConfig.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import Foundation

class AppConfig {
    private static let env = ProcessInfo.processInfo.environment
    
    public static let apiBaseUrl: String = env["API_BASE_URL"] ?? ""
    
    public static func setupEnv() {
        guard let path = Bundle.main.path(forResource: ".env", ofType: nil) else {
            fatalError("Not found: 'config/.env'.")
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let str = String(data: data, encoding: .utf8) ?? "Empty File"
            let clean = str.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "'", with: "")
            let envVars = clean.components(separatedBy: "\n")
            for envVar in envVars {
                let keyVal = envVar.components(separatedBy: "=")
                if keyVal.count == 2 {
                    setenv(keyVal[0], keyVal[1], 1)
                }
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
