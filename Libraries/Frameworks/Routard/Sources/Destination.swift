//
//  Destination.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Dependencies

public enum Destination: Equatable, Hashable, Identifiable, @unchecked Sendable {

    case details(id: String)
    case home
    case settings
    case splashScreen
    case tabBar

    public var id: String {
        switch self {
            case let .details(id): id
            default: UUID().uuidString
        }
    }

    public var name: String {
        switch self {
            case .home: "home"
            case .details(let id): "details-\(id)"
            case .settings: "settings"
            case .splashScreen: "splashScreen"
            case .tabBar: "tabBar"
        }
    }

    // MARK: - Equatable

    public static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    @MainActor var view: AnyView {
        @Dependency(\.viewFactory)
        var viewFactory

        return viewFactory.getView(self)
    }
}
