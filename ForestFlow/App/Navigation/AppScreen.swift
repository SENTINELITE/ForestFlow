//
//  AppScreen.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import Foundation

enum AppScreen: CaseIterable {
    case forest
    case settings
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
        case .forest:
            Label("Waldlisten", systemImage: "square.stack")
        case .settings:
            Label("Einstellungen", systemImage: "gear")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .forest:
            ForestListView()
        case .settings:
            SettingsView()
        }
    }
}

