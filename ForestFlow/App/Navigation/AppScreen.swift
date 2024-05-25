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
    case map
    case settings
}

extension AppScreen {
    var navigationTitle: String {
        switch self {
        case .forest: "Waldliste"
        case .map: "Karte"
        case .settings: "Einstellungen"
        }
    }

    @ViewBuilder
    var label: some View {
        switch self {
        case .forest:
            Label("Waldlisten", systemImage: "square.stack")
        case .map:
            Label("Karte", systemImage: "map")
        case .settings:
            Label("Einstellungen", systemImage: "gear")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .forest:
            ForestListView()
        case .map:
            MapView()
        case .settings:
            SettingsView()
        }
    }
}

