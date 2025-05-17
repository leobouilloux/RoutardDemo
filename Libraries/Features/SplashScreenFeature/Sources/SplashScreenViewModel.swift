//
//  SplashScreenViewModel.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import Dependencies

import Routard

@MainActor
final class SplashScreenViewModel: ObservableObject {

    @Dependency(\.routard)
    private var routard

    func loadData() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        routard.setRoot(.tabBar)
    }
}
