//
//  SignUpViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
}