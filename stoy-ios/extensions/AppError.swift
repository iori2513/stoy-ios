//
//  AppError.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation

enum AppError: Error {
    case api(message: String)
    case other(message: String)
}
