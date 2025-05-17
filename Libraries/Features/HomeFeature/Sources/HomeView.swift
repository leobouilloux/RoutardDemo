//
//  HomeView.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Routard

public struct HomeView: View {

    @Environment(\.navigationRouterId)
    private var navigationRouterId
    @Environment(\.tabRouterId)
    private var tabRouterId

    @ObservedObject private var viewModel = HomeViewModel()

    public init() {}

    public var body: some View {
        Form {
            Section("Navigation\n\(navigationRouterId)") {
                Button {
                    viewModel.push(destination: .home)
                } label: {
                    Text("Push Home")
                }
                Button {
                    viewModel.push(destination: .settings)
                } label: {
                    Text("Push Settings")
                }
                Button {
                    viewModel.push(destination: .details(id: viewModel.randomId))
                } label: {
                    Text("Push Details-\(viewModel.randomId)")
                }
                Button {
                    viewModel.navigateBack()
                } label: {
                    Text("Navigation back")
                }
                .accentColor(.red)
                Button {
                    viewModel.navigateToRoot()
                } label: {
                    Text("Navigate to root")
                }
                .accentColor(.red)
            }
            Section("Presentation") {
                Button {
                    viewModel.present(destination: .home)
                } label: {
                    Text("Present Home")
                }
                Button {
                    viewModel.present(destination: .settings)
                } label: {
                    Text("Present Settings")
                }
                Button {
                    viewModel.present(destination: .details(id: viewModel.randomId))
                } label: {
                    Text("Present Details-\(viewModel.randomId)")
                }
                Button {
                    viewModel.fullScreen(destination: .home)
                } label: {
                    Text("Present fullscreen Home")
                }
                Button {
                    viewModel.fullScreen(destination: .settings)
                } label: {
                    Text("Present fullscreen Settings")
                }
                Button {
                    viewModel.fullScreen(destination: .details(id: viewModel.randomId))
                } label: {
                    Text("Present fullscreen Details-\(viewModel.randomId)")
                }

                Button {
                    viewModel.dismiss()
                } label: {
                    Text("Dismiss")
                }
                .accentColor(.red)
            }
            Section("TabBar\n\(tabRouterId)") {
                Button {
                    viewModel.selectTab(tag: 0)
                } label: {
                    Text("Select first Tab")
                }
                Button {
                    viewModel.selectTab(tag: 1)
                } label: {
                    Text("Select second Tab")
                }
                Button {
                    viewModel.selectTab(tag: 2)
                } label: {
                    Text("Select third Tab")
                }
            }
            Section("App") {
                Button {
                    viewModel.setRoot()
                } label: {
                    Text("Reload SplashScreen")
                }
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.large)
        .task {
            viewModel.setNavigationRouterId(navigationRouterId)
            viewModel.setTabBarRouterId(tabRouterId)
        }
    }
}
