//
//  SplashScreenView.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Routard

public struct SplashScreenView: View {

    @Environment(\.navigationRouterId)
    private var navigationRouterId

    @ObservedObject private var viewModel = SplashScreenViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Text("SplashScreen")
                .font(.largeTitle)
                .bold()
            ProgressView()

        }
        .task { [weak viewModel] in
            await viewModel?.loadData()
        }
    }
}
