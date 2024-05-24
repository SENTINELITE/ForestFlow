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
    
    @FocusState var focusedField: UUID?
    
    @State var name: String
    @State var currentStage: Int = 0
    @State var rateValues: [RateValue]
    @State private var showAlert: Bool = false
    
    var body: some View {
        Form {
            Section("Tarif") {
                TextField("Tarif", text: $name)
            }
            
            Section("Stufen") {
                ForEach(rateValues.sorted(by: { $0.stage > $1.stage }), id: \.id) { rateValue in
                    RateValueStepper(focusedField: $focusedField, rateValue: .constant(rateValue))
                        .swipeActions {
                            Button {
                                if rateValue.canDelete() != nil {
                                    showAlert.toggle()
                                } else {
                                    rateValues.remove(object: rateValue)
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
        .onAppear {
            rateValues = rateType?.rateValues ?? []
        }
        .onDisappear {
            if name.isEmpty {
                if let existingRateType = rateType {
                    context.delete(existingRateType)
                }
            }
        }
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
        rateType?.name = name
        rateType?.rateValues = rateValues
        
        dismiss()
        
    }
    
    private func createRateValue() {
        let nextStage = (rateValues.last?.stage ?? 0) + 1
        let rateValue = RateValue(stage: nextStage, volume: 0.0)
        focusedField = rateValue.id
        rateValues.append(rateValue)
        
    }
}


