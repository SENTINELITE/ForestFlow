//
//  SheetDetailView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 25.05.2024.
//

import SwiftUI

struct SelectionDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTree: Tree?
    
    var body: some View {
        if let tree = selectedTree {
            Form {
                Section("Bauminformationen") {
                    Text(tree.woodType.name)
                    Text("Stufe: \(tree.rateValue?.stage ?? 0)")
                    Text("Volumen: \(tree.rateValue?.volume.string(decimalPlaces: 2) ?? "0.0")")
                }
                
                Section("Waldbesitzer") {
                    Text(tree.forestOwner?.name ?? "")
                }
                
                Section("Bemerkungen") {
                    Text(tree.remark?.name ?? "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                        selectedTree = nil
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.accent)
                    }
                }
            }
        }
    }
}

