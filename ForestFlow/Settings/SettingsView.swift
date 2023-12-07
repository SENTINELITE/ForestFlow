//
//  SettingsView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 18.06.23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Allgemein") {
                    SettingsItemView(name: "Erscheinungsbild", systemImage: "moon.fill")
                    SettingsItemView(name: "App Symbol", systemImage: "app.badge.checkmark")
                }
                Section("Support") {
                    SettingsItemView(name: "Kontaktiere mich", systemImage: "envelope.fill")
                    SettingsItemView(name: "Bewerte die App", systemImage: "heart.fill")
                }
                Section("Mehr") {
                    SettingsItemView(name: "Mit einem Freund teilen", systemImage: "square.and.arrow.up")
                    SettingsItemView(name: "Über Forest Flow", systemImage: "signature")
                }
            }
            .navigationTitle("Einstellungen")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                        print("Dismiss tapped")
                    } label: {
                        Text("Fertig")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
