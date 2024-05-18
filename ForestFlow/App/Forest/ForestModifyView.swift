//
//  ForestAddView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct ForestModifyView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @Query var rateTypes: [RateType]
    
    @Binding var forest: Forest?
    
    @State var name: String
    @State var location: String
    @State var rateType: RateType?
    @State var cropLoss: Int
    
    let isEditing: Bool
    
    var body: some View {
        Form {
            Section("Informationen") {
                TextField("Name", text: $name)
                TextField("Ort", text: $location)
            }
            
            Section("Tarifeinstellung") {
                if rateTypes.isEmpty {
                    ContentUnavailableView(
                        "Noch keine Tarife angelegt",
                        systemImage: "eurosign.arrow.circlepath" ,
                        description: Text("Erstelle einen neuen Tarif unter Einstellungen -> Tarif")
                    )
                } else {
                    CircleSelection(items: rateTypes, selected: $rateType)
                }
                
                Picker("Ernteverlust", selection: $cropLoss) {
                    ForEach(5...20, id: \.self) { percent in
                        Text("\(percent) %")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Text("Speichern")
                    .button {
                        self.saveForest()
                    }
                    .disabled(rateTypes.isEmpty || name.isEmpty)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            if isEditing {
                rateType = forest?.rateType
            } else {
                rateType = rateTypes.first
            }
        }
    }
    
    func saveForest() {
        if isEditing {
            forest?.name = name
            forest?.location = location
            forest?.rateType = rateType
            forest?.cropLoss = cropLoss
        } else {
            let forest = Forest(name: name, location: location, rateType: rateType, cropLoss: cropLoss)
            rateType?.forests.append(forest)
            context.insert(forest)
        }
        dismiss()
    }
}
