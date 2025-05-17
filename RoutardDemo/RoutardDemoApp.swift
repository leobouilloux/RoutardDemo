//
//  RoutardDemoApp.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

//import AppFeature
import Routard
import HomeFeature

@main
struct RoutardDemoApp: App {
    let appRouter = AppRouter(root: .splashScreen)
    let viewModel = AppCoordinatorViewModel()

    var body: some Scene {
        WindowGroup {
            AppCoordinator(router: appRouter, viewModel: viewModel)
        }
    }
}
