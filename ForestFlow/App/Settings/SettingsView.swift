//
//  SettingsView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 05.01.24.
//

import SwiftUI

struct SettingsView: View {
    @State var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            List {
                NavigationLink(value: "RateType") {
                    Label("Tarife", systemImage: "eurosign.arrow.circlepath")
                }
                NavigationLink(value: "Remark") {
                    Label("Bemerkungen", systemImage: "text.bubble.fill")
                }
                NavigationLink(value: "WoodType") {
                    Label("Baumart", systemImage: "tree.fill")
                }
                NavigationLink(value: "ForestOwner") {
                    Label("Waldbesitzer", systemImage: "person.fill")
                }
            }
            .navigationTitle("Einstellungen")
            .navigationDestination(for: String.self) { setting in
                if setting == "RateType" {
                    RateTypesView(path: $path)
                } else if setting == "Remark" {
                    RemarksView()
                } else if setting == "WoodType" {
                    WoodTypesView()
                } else if setting == "ForestOwner" {
                    ForestOwnersView()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
