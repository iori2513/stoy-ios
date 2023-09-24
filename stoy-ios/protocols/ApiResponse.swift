//
//  ApiResponse.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/20.
//

import Foundation

protocol ApiResponse {
    var status: ApiResponseStatus { get }
}

enum ApiResponseStatus {
    case success
    case error
}
