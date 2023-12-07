//
//  AddNewEntryView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 20.05.23.
//

import SwiftUI
import SwiftData

struct AddListView: View {
    @State private var name = ""
    @State private var location = ""
    @State private var selectedValue1 = 0
    @State private var selectedValue2 = 12
    @State private var forestOwners = ""
    
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Name", text: $name)
                    TextField("Ort", text: $location)
                }
                Section {
                    ForestOwnerView()
                }
                Section {
                    Picker("Tarif", selection: $selectedValue1) {
                        Text("Lang").tag(0)
                        Text("Mittel").tag(1)
                        Text("Kurz").tag(2)
                    }
                    Picker("Ernteverlust", selection: $selectedValue2) {
                        ForEach((5...20), id: \.self) {
                            Text("\($0)%")
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        let listEntry = ListElement(name: name, location: location, forestOwners: forestOwners, tariff: Int16(selectedValue1), cropLoss: Int16(selectedValue2))
                        
                        modelContext.insert(listEntry)
                        dismiss()
                        print("Done tapped")
                    } label: {
                        Text("Fertig")
                            .fontWeight(.bold)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Neue Liste")
                        .fontWeight(.medium)
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                        print("Cancel tapped")
                    } label: {
                        Text("Abbrechen")
                    }
                }
            }
        }
    }
}

#Preview {
    AddListView()
        .modelContainer(for: [ListElement.self, TreeElement.self])
}
