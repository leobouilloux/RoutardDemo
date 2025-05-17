//
//  TabBarCoordinator.swift
//  Routard
//
//  Created by Leo Marcotte on 17/03/2025.
//

import SwiftUI

public struct TabBarCoordinator: View {

    @ObservedObject private var tabRouter = TabRouter()

    private let viewModel = TabBarCoordinatorViewModel()
    private let coordinators: [AnyView]

    public init(items: [TabBarItem]) {
        self.coordinators = items.map { item in
            AnyView(
                NavigationCoordinator(rootDestination: item.destination)
                    .tabItem {
                        Label(item.title, systemImage: item.systemImage)
                    }
                    .tag(item.id)
            )
        }
    }

    public var body: some View {
        TabView(selection: $tabRouter.selectedTab) {
            ForEach(Array(zip(coordinators.indices, coordinators)), id: \.0) { _, coordinator in
                coordinator
            }
        }
        .task {
            viewModel.subscribeForNavigation(tabRouter: tabRouter)
        }
        .environment(\.tabRouterId, tabRouter.id)
    }
}
