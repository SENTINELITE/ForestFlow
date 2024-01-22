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
    
    
    init(_ remark: Remark?) {
        self._remark = .constant(remark)
        self._name = .init(initialValue: remark?.name ?? "")
        self.isEditing = remark != nil ? true: false
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $name)
            }
            
            Spacer()
            
            Button {
                saveRemark()
            } label: {
                Text("Anlegen")
                    .padding()
            }

        }
    }
    
    func saveRemark() {
        let remark = Remark(name: name)
        context.insert(remark)
    }
    
}

