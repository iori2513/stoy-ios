//
//  ApiBodyDataFetchListReponse.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/11/22.
//

import Foundation

struct ApiBodyDataFetchListReponse: ApiResponse, Decodable {
    typealias ResultType = Result
    var result: Result?
    var status: ApiResponseStatus
    var errorMessage: String?

    struct Result: Decodable {
        var dataList: [BodyData]
    }
}
