// Copyright © Radio France. All rights reserved.

import Combine
import SwiftUI

import Dependencies

@MainActor
public final class AppCoordinatorViewModel {

    @Dependency(\.routard)
    private var routard

    private var didSetup = false
    private var cancellables = Set<AnyCancellable>()

    var rootView: AnyView!

    public init() {}

    func subscribeForRoot(appRouter: AppRouter) {
        guard !didSetup else { return }

        didSetup = true

        routard.observeRoot()
            .sink { destination in
                appRouter.setRoot(destination: destination)
            }
            .store(in: &cancellables)
    }
}
