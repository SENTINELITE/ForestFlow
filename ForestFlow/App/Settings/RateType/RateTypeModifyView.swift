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
    @State private var showAlert: Bool = false
    let isEditing: Bool?
    
    var body: some View {
        Form {
            Section("Tarif") {
                TextField("Tarif", text: $name)
            }
            
            Section("Stufen") {
                ForEach(rateType?.rateValues.sorted(by: { $0.stage > $1.stage }) ?? [], id: \.self) { rateValue in
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
        .onAppear {
            
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
            Text("Element konnte nicht gelöscht werden da eine Referenz zu einem anderen Element besteht.")
        }
    }
    
    private func save() {
        if isEditing ?? false {
            rateType?.name = name
        }
        dismiss()
        
    }
    
    private func createRateValue() {
        let nextStage = (rateType?.rateValues.last?.stage ?? 0) + 1
        let rateValue = RateValue(stage: nextStage, volume: 0.0)
        rateType?.rateValues.append(rateValue)
        
    }
}


