//
//  RoutardDependency.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import Foundation

import Dependencies

public extension DependencyValues {

    var routard: RoutardClient {
        get { self[RoutardClient.self] }
        set { self[RoutardClient.self] = newValue }
    }
}

extension RoutardClient: DependencyKey {

    public static let liveValue: Self = {

        let manager = RoutardManager()

        return Self(
            setRoot: { destination in
                manager.setRoot(destination: destination)
            },
            observeRoot: {
                manager.observeAppDestination()
            },
            sendNavigationAction: { navigationRouterId, action in
                manager.send(id: navigationRouterId, navigationAction: action)
            },
            observeNavigation: { id in
                manager.observeNavigationWith(id: id)
            },

            sendTabBarAction: { tabBarRouterId, action in
                manager.send(id: tabBarRouterId, tabBarAction: action)
            },
            observeTabBar: { id in
                manager.observeTabBarWith(id: id)
            }
        )
    }()
}

public extension RoutardClient {

    static let previewValue = Self()
    static let testValue = Self()
}
