//
//  RoutardManager.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

@preconcurrency import Combine
import SwiftUI

import Dependencies

public final class RoutardManager: Sendable {

    // MARK: - Private properties

    nonisolated private let appDestinationSubject = PassthroughSubject<Destination, Never>()
    nonisolated private let navigationActionSubject = PassthroughSubject<(String, NavigationAction), Never>()
    nonisolated private let tabBarActionSubject = PassthroughSubject<(String, TabBarAction), Never>()
    nonisolated private let selectedTabSubject = PassthroughSubject<(String, Int), Never>()
}

// MARK: - App

extension RoutardManager {

    func observeAppDestination() -> AnyPublisher<Destination, Never> {
        appDestinationSubject.eraseToAnyPublisher()
    }

    func setRoot(destination: Destination) {
        appDestinationSubject.send(destination)
    }
}

// MARK: - Navigation

extension RoutardManager {

    func observeNavigationWith(id: String) -> AnyPublisher<(NavigationAction), Never> {
        navigationActionSubject
            .filter { $0.0 == id }
            .map { $1 }
            .eraseToAnyPublisher()
    }

    func send(id: String?, navigationAction: NavigationAction) {
        if let id {
            navigationActionSubject.send((id, navigationAction))
        } else {
            print("navigationRouterId should be sent, maybe you forgot to pass the value from the environment")
        }
    }
}

// MARK: - TabBar

extension RoutardManager {

    func observeTabBarWith(id: String) -> AnyPublisher<(TabBarAction), Never> {
        tabBarActionSubject
            .filter { $0.0 == id }
            .map { $1 }
            .eraseToAnyPublisher()
    }

    func send(id: String?, tabBarAction: TabBarAction) {
        if let id {
            tabBarActionSubject.send((id, tabBarAction))
        } else {
            print("tabBarRouterId should be sent, maybe you forgot to pass the value from the environment")
        }
    }
}
