//
//  AppViewFactory+Settings.swift
//  RoutardDemo
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import SettingsFeature

extension AppViewFactory {

    func settingsView() -> AnyView {
        AnyView(
            SettingsView()
        )
    }
}
