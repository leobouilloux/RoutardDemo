//
//  AppViewFactory.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Routard

@MainActor
final class AppViewFactory: Sendable {

    func getView(for destination: Destination) -> AnyView {
        switch destination {
            case .details(let id): detailsView(id: id)
            case .home: homeView()
            case .settings: settingsView()
            case .splashScreen: splashScreenView()
            case .tabBar: tabBarView()
        }
    }
}
