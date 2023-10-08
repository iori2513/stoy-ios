//
//  UserService.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import Foundation
import Alamofire
import SwiftUI

class UserService {
    public static let shared = UserService()

    @Published private(set) var user: User?

    init(user: User? = nil) {
        self.user = user
        Task {
            do {
                print("init")
                let user: User = try await self.fetchUser(token: AppStore.token)
                self.user = user
            } catch {
                print(error)
            }
        }
    }

    @MainActor
    public func register(params: ApiAuthRegisterParam) async throws {
        let params = UtilGeneral.structToStringDictionary(params)
        let url = AppConfig.apiBaseUrl + "/auth/register"
        let response = await AF.request(
            url,
            method: .post,
            parameters: params,
            encoder: .json).serializingDecodable(ApiAuthRegisterResponse.self).response
        switch response.result {
        case .success(let data):
            if data.status == .success {
                return
            }
        case .failure(let error):
            throw AppError.api(message: error.localizedDescription)
        }
    }

    @MainActor
    public func login(params: ApiAuthLoginParam) async throws {
        let params = UtilGeneral.structToStringDictionary(params)
        let url = AppConfig.apiBaseUrl + "/auth/login"
        let response = await AF.request(url, method: .post, parameters: params, encoder:
                                            .json).serializingDecodable(ApiAuthLoginResponse.self).response
        switch response.result {
        case .success(let data):
            if data.status == .success {
                do {
                    guard let result = data.result else { throw AppError.api(message: "no result") }
                    AppStore.token = result.token
                    let user: User = try await self.fetchUser(token: result.token)
                    self.user = user
                } catch {
                    throw error
                }
            }

        case .failure(let error):
            throw AppError.api(message: error.localizedDescription)
        }
    }

    @MainActor
    public func fetchUser(token: String) async throws -> User {
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        let url = AppConfig.apiBaseUrl + "/auth/user"
        let response = await AF.request(url, method: .get, headers: headers).serializingDecodable(ApiAuthFetchUserResponse.self).response
        print(response)
        switch response.result {
        case .success(let data):
            if data.status == .success {
                guard let result = data.result else { throw AppError.api(message: "no result") }
                return result.user
            }
        case .failure(let error):
            throw AppError.api(message: error.localizedDescription)
        }
        throw AppError.api(message: "unknown error")
    }
}
