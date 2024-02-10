//
//  ForestOwnerEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI

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
            
            
            Button {
                saveForestOwner()
            } label: {
                Text("Anlegen")
                    .frame(width: 250, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
            }
            
        }
        .padding()
//        .onAppear {
//            dump(forestOwner)
//            if isEditing {
//                name = forestOwner?.name ?? ""
//            }
//            
//        }
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


