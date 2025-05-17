//
//  NavigationCoordinator.swift
//  Routard
//
//  Created by Leo Marcotte on 17/03/2025.
//

import SwiftUI

public struct NavigationCoordinator: View {

    @Environment(\.presentationMode)
    private var presentationMode

    private let rootView: AnyView
    private let viewModel = NavigationCoordinatorViewModel()
    @ObservedObject private var navigationRouter = NavigationRouter()

    public init(rootDestination: Destination) {
        self.rootView = rootDestination.view
    }

    public var body: some View {
        NavigationStack(path: $navigationRouter.navPath) {
            rootView
                .sheet(item: $navigationRouter.presentedSheet) { destination in
                    NavigationCoordinator(rootDestination: destination)
                }
                .fullScreenCover(item: $navigationRouter.fullScreenSheet) { destination in
                    NavigationCoordinator(rootDestination: destination)
                }
                .navigationDestination(for: Destination.self) { destination in
                    destination.view
                }
        }
        .onChange(of: navigationRouter.shouldDismiss) { _ in
            presentationMode.wrappedValue.dismiss()
        }
        .task {
            viewModel.subscribeForNavigation(navigationRouter: navigationRouter)
        }
        .environment(\.navigationRouterId, navigationRouter.id)
    }
}
