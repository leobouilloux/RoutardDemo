//
//  ViewFactory+Live.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Dependencies

import Routard

extension ViewFactory: DependencyKey {

    public static let liveValue: Self = {
        let factory = AppViewFactory()

        return Self(
            getView: { destination in
                factory.getView(for: destination)
            }
        )
    }()
}
