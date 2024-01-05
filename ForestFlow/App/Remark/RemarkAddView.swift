//
//  RemarkAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct RemarkAddView: View {
    @Query private var remarks: [Remark]
    @Environment(\.modelContext) var context
    
    @State private var showAlert = false
    
    @State private var name: String = ""
    
    var body: some View {
        List {
            ForEach(remarks, id: \.self) { remark in
                Text(remark.name)
            }
        }
        .navigationTitle("Bemerkungen")
        .overlay(alignment: .bottomTrailing) {
            PlusButton()
                .button {
                    showAlert.toggle()
                }
        }
        .alert("Hinzufügen", isPresented: $showAlert, actions: {
            TextField("Name", text: $name)
            
            Button("Speichern", action: {
                saveRemark()
                name = ""
            })
            Button("Abbrechen", role: .cancel, action: {})
        }, message: {
            Text("Bitte gib eine Bemerkung ein.")
        })
    }
    
    func saveRemark() {
        let remark = Remark(name: name)
        context.insert(remark)
    }
}
