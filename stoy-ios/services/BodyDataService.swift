//
//  BodyDataService.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/11/18.
//

import Foundation
import Alamofire
import SwiftUI

class BodyDataService {
    public static let shared = BodyDataService()

    @Published private(set) var bodyDataList: [BodyData] = []

    @MainActor
    public func addData(token: String, param: ApiBodyDataParam) async throws {
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        let url = AppConfig.apiBaseUrl + "/bodyData/add"
        let response = await AF.request(
            url,
            method: .post,
            parameters: param,
            encoder: .json,
            headers: headers).serializingDecodable(ApiBodyDataAddResponse.self).response
        switch response.result {
        case .success(let data):
            if data.status == .success {
                guard data.result != nil else { throw AppError.api(message: "no result") }
                return
            } else {
                throw AppError.api(message: data.errorMessage ?? "unknown error")
            }
        case .failure(let error):
            throw AppError.api(message: error.localizedDescription)
        }
    }

    public func fetchData(token: String) async throws {
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        let url = AppConfig.apiBaseUrl + "/bodyData/fetch"
        let response = await AF.request(
            url,
            method: .get,
            headers: headers).serializingDecodable(ApiBodyDataFetchListReponse.self).response
        switch response.result {
        case .success(let data):
            if data.status == .success {
                guard let list = data.result?.dataList else { throw AppError.api(message: "no result") }
                self.bodyDataList = list
            } else {
                throw AppError.api(message: data.errorMessage ?? "unknown error")
            }
        case .failure(let error):
            print(error)
            throw AppError.api(message: error.localizedDescription)
        }

    }
}
