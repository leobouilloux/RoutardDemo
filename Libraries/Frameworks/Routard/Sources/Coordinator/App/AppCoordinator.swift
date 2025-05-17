// Copyright © Radio France. All rights reserved.

import SwiftUI

public struct AppCoordinator: View {

    private let viewModel: AppCoordinatorViewModel

    @ObservedObject private var appRouter: AppRouter

    public init(router: AppRouter, viewModel: AppCoordinatorViewModel) {
        self.appRouter = router
        self.viewModel = viewModel
    }

    public var body: some View {
        appRouter.root.view
            .task {
                viewModel.subscribeForRoot(appRouter: appRouter)
            }
    }
}
