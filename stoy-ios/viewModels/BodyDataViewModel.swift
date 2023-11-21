//
//  BodyDataViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/11/18.
//

import SwiftUI

class BodyDataViewModel: ObservableObject {
    @Published var weight: Double = 0
    @Published var fatPercent: Double = 0

    func addBodyData() async {
        do {
            GeneralService.shared.showPageLoading()
            try await BodyDataService.shared.addData(token: AppStore.token, param: .init(weight: 50.00, fatPercentage: 14.5))
            //            GeneralService.shared.hidePageLoading()
        } catch {
            print(error)
        }
        GeneralService.shared.hidePageLoading()
    }
}
