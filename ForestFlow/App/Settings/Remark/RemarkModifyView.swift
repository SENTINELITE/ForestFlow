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
            
            Button {
                saveRemark()
            } label: {
                Text("Speichern")
                    .font(.Bold.title2)
                    .frame(width: 250, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
        }
        .padding()
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

