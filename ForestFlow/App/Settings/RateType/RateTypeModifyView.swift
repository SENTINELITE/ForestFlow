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
    
    @State var rateValues: [RateValue]
    
    @State var name: String
    let isEditing: Bool
    
    var body: some View {
        VStack {
            Form {
                Section("Tarif") {
                    TextField("Tarif", text: $name)
                }
                
                Section("Stufen") {
                    ForEach(rateValues.sorted(by: { $0.stage > $1.stage }), id: \.self) { rateValue in
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
           
            Spacer()
            
            Button {
                save()
            } label: {
                Text("Anlegen")
                    .frame(width: 250, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    private func save() {
        if isEditing {
            rateType?.name = name
            rateType?.rateValues = rateValues 
        }
        dismiss()
        
    }
    
    private func createRateValue() {
        let nextStage = (rateValues.last?.stage ?? 0) + 1
        let rateValue = RateValue(stage: nextStage, volume: 0.0)
        rateValues.append(rateValue)
        
    }
}


