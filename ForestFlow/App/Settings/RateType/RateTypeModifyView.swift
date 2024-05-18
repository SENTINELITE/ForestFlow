//
//  RateValueEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI
import SwiftData

struct RateTypeModifyView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @Binding var rateType: RateType?
    
    @State var name: String
    @State var currentStage: Int = -1
    @State var rateValues: [RateValue]
    @State private var showAlert: Bool = false
    let isEditing: Bool
    
    var body: some View {
        Form {
            Section("Tarif") {
                TextField("Tarif", text: $name)
            }
            
            Section("Stufen") {
                ForEach(rateValues.sorted(by: { $0.stage > $1.stage }), id: \.self) { rateValue in
                    RateValueStepper(rateValue: .constant(rateValue))
                        .swipeActions {
                            Button {
                                if rateValue.canDelete() != nil {
                                    showAlert.toggle()
                                } else {
                                    context.delete(rateValue)
                                }
                            } label: {
                                Text("Delete")
                            }
                            .tint(rateValue.canDelete() != nil ? .gray : .red)
                        }
                }
                
                AddButton()
                    .button {
                        createRateValue()
                    }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Text("Speichern")
                    .button {
                        save()
                    }
                    .disabled(name.isEmpty)
            }
        }
        .alert("Löschen nicht möglich", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Dieses Element kann nicht gelöscht werden, da es in verwendung ist")
        }
    }
    
    private func save() {
        if isEditing {
            rateType?.name = name
            rateType?.rateValues = rateValues
        } else {
            let rateType = RateType(name: name, rateValues: rateValues)
            context.insert(rateType)
        }
        dismiss()
        
    }
    
    private func createRateValue() {
        currentStage += 1
        let rateValue = RateValue(stage: currentStage, volume: 0.0)
        rateValues.append(rateValue)
        
    }
}


