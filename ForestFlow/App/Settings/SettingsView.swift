//
//  SettingsView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 05.01.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(Setting.allCases, id: \.self) { setting in
                    NavigationLink(value: setting) {
                        setting.label
                    }
                }
            }
            .navigationTitle("Einstellungen")
            .navigationDestination(for: Setting.self) { setting in
                setting.destination
            }
        }
    }
}

#Preview {
    SettingsView()
}
