//
//  GeneralService.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation
import SwiftUI

class GeneralService {
    public static let shared = GeneralService()

    @Published private(set) var isLoading: Bool = false

    public func showPageLoading() {
        self.isLoading = true
    }

    public func hidePageLoading() {
        self.isLoading = false
    }
}
