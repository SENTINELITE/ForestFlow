//
//  ForestOwnerAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct ForestOwnerAddView: View {
    @Query private var forestOwners: [ForestOwner]
    @Environment(\.modelContext) var context
    
    @State private var showAlert = false
    
    @State private var name: String = ""
    
    var body: some View {
        List {
            ForEach(forestOwners, id: \.self) { forestOwner in
                Text(forestOwner.name)
            }
        }
        .overlay(alignment: .bottomTrailing) {
            PlusButton()
                .button {
                    showAlert.toggle()
                }
                .alert("Hinzufügen", isPresented: $showAlert, actions: {
                    TextField("Name", text: $name)
                    
                   Button("Speichern", action: {
                       saveForestOwner()
                   })
                    Button("Abbrechen", role: .cancel, action: {})
                }, message: {
                    Text("Bitte gib den Namen des Waldbesitzers ein.")
                })
        }
    }
    
    func saveForestOwner() {
        let forestOwner = ForestOwner(name: name)
        context.insert(forestOwner)
    }
}

#Preview {
    ForestOwnerAddView()
}
