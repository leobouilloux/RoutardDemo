//
//  TabRouter.swift
//  LeoUI
//
//  Created by Leo Marcotte on 28/10/2024.
//

import Foundation
import SwiftUI

public final class TabRouter: ObservableObject {

    public let id = UUID().uuidString

    @Published public var selectedTab: Int?

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

    public func dismiss() {
        shouldDismiss = true
    }
}
