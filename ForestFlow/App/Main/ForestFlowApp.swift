//
//  ForestFlowApp.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

@main
struct ForestFlowApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [
                    Forest.self,
                    ForestOwner.self,
                    Tree.self,
                    WoodType.self,
                    Remark.self
                ])
        }
    }
}
