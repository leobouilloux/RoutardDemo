//
//  TabBarViewModel.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Dependencies

import Routard

final class TabBarViewModel: ObservableObject {

    @Dependency(\.routard)
    private var routard

    var navigationRouterId: String?

    func setNavigationRouterId(_ id: String) {
        navigationRouterId = id
    }

    func pushDetails(id: String) {
        routard.send(
            navigationRouterId: navigationRouterId,
            action: .push(.details(id: id))
        )
    }
}
