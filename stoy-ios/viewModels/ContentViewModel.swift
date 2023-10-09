//
//  ContentViewModel.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/10/09.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published private(set) var user: User?
    @Published private(set) var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        setSubscribers()
    }

    private func setSubscribers() {
        UserService.shared.$user.receive(on: DispatchQueue.main).sink { [weak self] user in
            guard let self = self else { return }
            self.user = user
        }.store(in: &cancellables)

        GeneralService.shared.$isLoading.sink { [weak self] isLoading in
            guard let self = self else { return }
            self.isLoading = isLoading
        }.store(in: &cancellables)
    }
}
