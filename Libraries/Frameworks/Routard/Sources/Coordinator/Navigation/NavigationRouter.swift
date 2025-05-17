//
//  Router.swift
//  LeoUI
//
//  Created by Leo Marcotte on 28/10/2024.
//

import Foundation
import SwiftUI

public final class NavigationRouter: ObservableObject, @unchecked Sendable {

    public let id: String = UUID().uuidString

    @Published public var navPath = NavigationPath()
    @Published public var presentedSheet: Destination?
    @Published public var fullScreenSheet: Destination?
    @Published public var shouldDismiss: Bool = false

    public init() {}

    public func presentSheet(destination: Destination) {
        presentedSheet = destination
    }

    public func fullScreenSheet(destination: Destination) {
        fullScreenSheet = destination
    }

    public func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    public func navigateBack() {
        guard !navPath.isEmpty else { return }

        navPath.removeLast()
    }

    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }

    public func dismiss() {
        shouldDismiss = true
    }
}
