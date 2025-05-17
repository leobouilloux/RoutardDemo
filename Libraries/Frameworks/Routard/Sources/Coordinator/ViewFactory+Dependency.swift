//
//  ViewFactory+Dependency.swift
//  Generic
//
//  Created by Thomas Fromont on 15/05/2025.
//

import SwiftUI

import Dependencies

public extension DependencyValues {

    var viewFactory: ViewFactory {
        get { self[ViewFactory.self] }
        set { self[ViewFactory.self] = newValue }
    }
}

extension ViewFactory: TestDependencyKey {

    public static let previewValue = Self()
    public static let testValue = Self()
}
