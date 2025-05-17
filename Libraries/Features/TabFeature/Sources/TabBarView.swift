//
//  TabBarView.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Routard

public struct TabBarView: View {

    @Environment(\.navigationRouterId)
    private var navigationRouterId

    @ObservedObject private var viewModel = TabBarViewModel()

    private let items: [TabBarItem] = [
        TabBarItem(id: 0, title: "Home", destination: .home, systemImage: "house"),
        TabBarItem(id: 1, title: "Settings", destination: .settings, systemImage: "gear"),
        TabBarItem(id: 2, title: "Details-1234", destination: .details(id: "1234"), systemImage: "number.square")
    ]

    public init() {}

    public var body: some View {
        TabBarCoordinator(items: items)
    }
}
