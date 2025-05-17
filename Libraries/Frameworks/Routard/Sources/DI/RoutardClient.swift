//
//  RoutardClient.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import Combine
import Foundation

import Dependencies
import DependenciesMacros

// swiftlint:disable all
@DependencyClient
public struct RoutardClient: Sendable {

    public var setRoot: @Sendable (Destination) -> Void
    public var observeRoot: @Sendable () -> AnyPublisher<Destination, Never> = { Just((.settings)).eraseToAnyPublisher() }

    var sendNavigationAction: @Sendable (String?, NavigationAction) -> Void
    public var observeNavigation: @Sendable (String) -> AnyPublisher<NavigationAction, Never> = { _ in Just((.dismiss)).eraseToAnyPublisher() }

    var sendTabBarAction: @Sendable (String?, TabBarAction) -> Void
    public var observeTabBar: @Sendable (String) -> AnyPublisher<(TabBarAction), Never> = { _ in Just((.dismiss)).eraseToAnyPublisher() }

    public func send(navigationRouterId: String?, action: NavigationAction) {
        sendNavigationAction(navigationRouterId, action)
    }

    public func send(tabBarRouterId: String?, action: TabBarAction) {
        sendTabBarAction(tabBarRouterId, action)
    }
}
// swiftlint:enable all
