//
//  ApiAuthRegisterResponse.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/19.
//

import Foundation

struct ApiAuthRegisterResponse: ApiResponse, Decodable {
    typealias ResultType = Result
    var result: Result
    var status: ApiResponseStatus
    
    struct Result: Decodable {
        var userId: String
    }
}

//struct Example1 {
//    var result: Result1
//    var status: Bool
//    
//    struct Result1 {
//        var userId: String
//    }
//}
//
//struct Example2 {
//    var result: Result2
//    var status: Bool
//    
//    struct Result2 {
//        var name: String
//    }
//}

