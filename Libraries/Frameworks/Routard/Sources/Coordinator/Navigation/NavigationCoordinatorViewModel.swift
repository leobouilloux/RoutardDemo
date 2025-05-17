//
//  NavigationCoordinatorViewModel.swift
//  Routard
//
//  Created by Leo Marcotte on 19/03/2025.
//

import Combine

import Dependencies

@MainActor
final class NavigationCoordinatorViewModel {

    @Dependency(\.routard)
    private var routard

    private var didSetup = false
    private var cancellables = Set<AnyCancellable>()

    func subscribeForNavigation(navigationRouter: NavigationRouter) {
        guard !didSetup else { return }

        didSetup = true

        routard.observeNavigation(navigationRouter.id)
            .sink { action in
                switch action {
                    case let .push(destination):
                        navigationRouter.navigate(to: destination)
                    case .pop:
                        navigationRouter.navigateBack()
                    case .popToRoot:
                        navigationRouter.navigateToRoot()

                    case let .present(destination):
                        navigationRouter.presentSheet(destination: destination)
                    case let .fullscreen(destination):
                        navigationRouter.fullScreenSheet(destination: destination)
                    case .dismiss:
                        navigationRouter.dismiss()
                }
            }
            .store(in: &cancellables)
    }
}
