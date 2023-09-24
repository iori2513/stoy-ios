//
//  ApiResponse.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/20.
//

import Foundation

protocol ApiResponse {
    associatedtype ResultType
    var status: ApiResponseStatus { get set }
    var result: ResultType { get set }
}

enum ApiResponseStatus: String, Decodable {
    case success = "success"
    case error = "error"
}
