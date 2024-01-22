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
            VStack(alignment: .leading, spacing: 20.0) {
                HStack(spacing: 20.0) {
                    NavigationLink(destination: RateTypeAddView()) {
                        Card(name: "Tarif", systemImage: "dollarsign.circle.fill")
                    }
                    NavigationLink(destination: ForestOwnerAddView()) {
                        Card(name: "Waldbesitzer", systemImage: "person.text.rectangle.fill")
                    }
                }
                HStack(spacing: 20.0) {
                    NavigationLink(destination: WoodTypeAddView()) {
                        Card(name: "Baumart", systemImage: "tree.circle.fill")
                    }
                    NavigationLink(destination: RemarkView()) {
                        Card(name: "Bemerkungen", systemImage: "pencil.and.list.clipboard")
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Einstellungen")
            .navigationDestination(for: Remark.self) { remark in
                RemarkModifyView(remark)
            }
            .navigationDestination(for: String.self) { _ in
                RemarkModifyView(nil)
            }
        }
    }
}

#Preview {
    SettingsView()
}
