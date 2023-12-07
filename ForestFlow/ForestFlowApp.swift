//
//  ForestFlowApp.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 20.05.23.
//

import SwiftUI
import SwiftData

@main
struct ForestFlowApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Listen", systemImage: "square.stack")
                    }
                
                MapView()
                    .tabItem {
                        Label("Karte", systemImage: "map.fill")
                    }
                ChartsView()
                    .tabItem {
                        Label("Statistik", systemImage: "chart.bar.fill")
                    }
            }.tint(.accentColor)
        }.modelContainer(for: ListElement.self)
    }
}
