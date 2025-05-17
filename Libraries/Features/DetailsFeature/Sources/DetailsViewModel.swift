//
//  DetailsViewModel.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Dependencies

import Routard

final class DetailsViewModel: ObservableObject {

    @Dependency(\.routard)
    private var routard

    let title: String
    let randomId: String = String(UUID().uuidString.prefix(4))

    private var navigationRouterId: String?
    private var tabBarRouterId: String?

    init(id: String) {
        self.title = "Details \(id)"
    }

    func setNavigationRouterId(_ id: String) {
        navigationRouterId = id
    }

    func setTabBarRouterId(_ id: String) {
        tabBarRouterId = id
    }

    // MARK: - NavigationCoordinator > Push / Pop / PopToRoot

    func push(destination: Destination) {
        routard.send(navigationRouterId: navigationRouterId, action: .push(destination))
    }

    func navigateBack() {
        routard.send(navigationRouterId: navigationRouterId, action: .pop)
    }

    func navigateToRoot() {
        routard.send(navigationRouterId: navigationRouterId, action: .popToRoot)
    }

    // MARK: - NavigationCoordinator > Present

    func present(destination: Destination) {
        routard.send(navigationRouterId: navigationRouterId, action: .present(destination))
    }

    func fullScreen(destination: Destination) {
        routard.send(navigationRouterId: navigationRouterId, action: .fullscreen(destination))
    }

    func dismiss() {
        routard.send(navigationRouterId: navigationRouterId, action: .dismiss)
    }

    // MARK: - TabBarCoordinator

    func selectTab(tag: Int) {
        routard.send(tabBarRouterId: tabBarRouterId, action: .changeTab(tag: tag))
    }

    // MARK: - AppCoordinator

    func setRoot() {
        routard.setRoot(.splashScreen)
    }
}
