//
//  AppViewFactory+SplashScreen.swift
//  AppFeature
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import SplashScreenFeature

extension AppViewFactory {

    func splashScreenView() -> AnyView {
        AnyView(
            SplashScreenView()
        )
    }
}
