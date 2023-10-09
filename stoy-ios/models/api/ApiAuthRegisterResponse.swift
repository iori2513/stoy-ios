//
//  ApiAuthRegisterResponse.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/19.
//

import Foundation

struct ApiAuthRegisterResponse: ApiResponse, Decodable {
    typealias ResultType = Result
    var result: Result?
    var status: ApiResponseStatus
    var errorMessage: String?

    struct Result: Decodable {
        var userId: String
    }
}
