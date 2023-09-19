//
//  LogInViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/18.
//

import Foundation
import SwiftUI

class LogInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
