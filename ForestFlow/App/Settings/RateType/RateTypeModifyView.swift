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
                            Button(role: .destructive) {
                                context.delete(rateValue)
                            } label: {
                                Image(systemName: "trash")
                            }
                            
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
            ToolbarItem(placement: .bottomBar) {
                Text("Speichern")
                    .font(.Bold.title2)
                    .frame(width: 250, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .button {
                        save()
                    }
                    .disabled(name.isEmpty)
                
            }
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
        try! context.save()
        
    }
}


