// Copyright © Radio France. All rights reserved.

import Foundation
import SwiftUI

public final class AppRouter: ObservableObject, @unchecked Sendable {

    public let id: String = UUID().uuidString

    @Published public var root: Destination

    public init(root: Destination) {
        self.root = root
    }

    public func setRoot(destination: Destination) {
        root = destination
    }
}
