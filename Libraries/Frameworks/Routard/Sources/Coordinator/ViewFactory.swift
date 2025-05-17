// Copyright © Radio France. All rights reserved.

import SwiftUI

import DependenciesMacros

@DependencyClient
public struct ViewFactory: @unchecked Sendable {

    public var getView: @MainActor @Sendable (Destination) -> AnyView = { _ in AnyView(EmptyView()) }
}
