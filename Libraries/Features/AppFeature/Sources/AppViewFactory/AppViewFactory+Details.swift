//
//  AppViewFactory+Details.swift
//  AppFeature
//
//  Created by Leo Marcotte on 17/05/2025.
//

import SwiftUI

import DetailsFeature

extension AppViewFactory {

    func detailsView(id: String) -> AnyView {
        AnyView(
            DetailsView(id: id)
        )
    }
}
