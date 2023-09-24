//
//  UserService.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import Foundation
import Alamofire

class UserService {
    public static let shared = UserService()
    
    @MainActor
    public func register(params: ApiAuthRegisterParam) async throws {
        let params = UtilGeneral.structToStringDictionary(params)
        let url = AppConfig.apiBaseUrl + "/auth/register"
        print(url)
        let response = await AF.request(
            url,
            method: .post,
            parameters: params,
            encoder: .json).serializingDecodable(ApiAuthRegisterResponse.self).response
        switch response.result {
            case .success(let data):
                print(data)
                if (data.status == .error)  {
                    print("error")
                }
                print(data.result.userId)
            case .failure(let error):
                print(error)
                
        }
    }
}
