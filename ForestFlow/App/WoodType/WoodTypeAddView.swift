//
//  WoodTypeAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct WoodTypeAddView: View {
    @Query private var woodTypes: [WoodType]
    @Environment(\.modelContext) var context
    
    @State private var showAlert = false
    
    @State private var name: String = ""
    
    var body: some View {
        List {
            ForEach(woodTypes, id: \.self) { woodType in
                NavigationLink {
                    WoodTypeEditView(woodType: woodType)
                } label: {
                    Text(woodType.name)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        context.delete(woodType)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
        .navigationTitle("Baumart")
        .toolbar(.hidden, for: .tabBar)
        .overlay(alignment: .bottomTrailing) {
            PlusButton()
                .button {
                    showAlert.toggle()
                }
        }
        .alert("Hinzufügen", isPresented: $showAlert, actions: {
            TextField("Name", text: $name)
            
            Button("Speichern", action: {
                saveWoodType()
                name = ""
            })
            Button("Abbrechen", role: .cancel, action: {})
        }, message: {
            Text("Bitte gib den Namen der Baumart ein.")
        })
        
    }
    
    func saveWoodType() {
        let woodType = WoodType(name: name)
        context.insert(woodType)
    }
}

