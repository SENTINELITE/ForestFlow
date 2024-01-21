//
//  RateValueEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI

struct RateValueEditView: View {
    @Bindable var rateType: RateType
    @Environment(\.modelContext) var context
    @State var volume: Float = 0.0
    @State var stage: Int = 0
    
    var body: some View {
        Form {
            Section("Tarif") {
                TextField("Tarif", text: $rateType.name)
            }
            
            Section("Stufen") {
                ForEach($rateType.rateValues, id: \.self) { $rateValue in
                    VStack(alignment: .leading) {
                        Text("Stufe: \(rateValue.stage)")
                        Stepper("Volumen: \(rateValue.volume)", value: $rateValue.volume, step: 0.1)
                    }
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
                        if let rateValue = rateType.rateValues.last?.stage {
                            stage = rateValue + 1
                        }
                
                        rateType.rateValues.append(RateValue(stage: stage, volume: volume))
                    }
            }
        }
    }
}


