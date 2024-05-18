//
//  WoodTypeEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI

struct WoodTypeModifyView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Binding var woodType: WoodType?
    @State var name: String
    
    let isEditing: Bool
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
            Spacer()
            
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    saveWoodType()
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
    
    func saveWoodType() {
        if isEditing {
            woodType?.name = name
        } else {
            let woodType = WoodType(name: name)
            context.insert(woodType)
        }
        dismiss()
    }
}

