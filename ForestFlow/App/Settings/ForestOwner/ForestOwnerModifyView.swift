//
//  ForestOwnerEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI
import SwiftData

struct ForestOwnerModifyView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Binding var forestOwner: ForestOwner?
    
    @State var name: String
    let isEditing: Bool
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            Spacer()
            
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    saveForestOwner()
                } label: {
                    Text("Speichern")
                }
                .disabled(name.isEmpty)
            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Abbrechen")
                }
            }
        }
    }
    
    
    func saveForestOwner() {
        if isEditing {
            forestOwner?.name = name
        } else {
            let forestOwner = ForestOwner(name: name)
            context.insert(forestOwner)
        }
        
        dismiss()
    }
}


