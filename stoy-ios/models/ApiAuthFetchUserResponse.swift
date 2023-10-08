//
//  ApiAuthFetchUserResponse.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation

struct ApiAuthFetchUserResponse: ApiResponse, Decodable {
    typealias ResultType = Result
    var status: ApiResponseStatus
    var result: Result?
    var errorMessage: String?

    struct Result: Decodable {
        var user: User
    }
}
