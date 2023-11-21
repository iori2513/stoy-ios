//
//  BodyData.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/11/22.
//

import Foundation

struct BodyData: Decodable {
    let id: String
    let userId: String
    var weight: Double
    var fatPercentage: Double?
    @AutoDecodedDate var createDate: Date
}
