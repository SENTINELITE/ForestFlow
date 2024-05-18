//
//  RemarkEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 16.01.2024.
//

import SwiftUI

struct RemarkModifyView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @Binding var remark: Remark?
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
                    saveRemark()
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
    
    func saveRemark() {
        if isEditing {
            remark?.name = name
        } else {
            let remark = Remark(name: name)
            context.insert(remark)
        }
        
        dismiss()
        
    }
    
}

