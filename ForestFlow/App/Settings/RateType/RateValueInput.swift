//
//  RateValueStepper.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 09.03.2024.
//
import SwiftUI

struct RateValueStepper: View {
    @FocusState.Binding var focusedField: UUID?

    // MARK: - Binding
    @Binding var rateValue: RateValue

    // MARK: - Body
    var body: some View {
        Grid(alignment: .leading) {
            GridRow {
                Text("Stufe:")
                    .font(.Bold.regular)
                
                Text(rateValue.stage.description)
                    .frame(minWidth: 55, maxWidth: 75, minHeight: 35, maxHeight: 45)
                    .font(.Bold.title)
                    .foregroundStyle(.white)
                    .background(Color.accent.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .gridColumnAlignment(.leading)
            }
            
            GridRow {
                Text("Volumen:")
                    .font(.Bold.regular)
                TextField("", value: $rateValue.volume, format: .number)
                    .focused($focusedField, equals: rateValue.id)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .padding()
                    .gridColumnAlignment(.leading)
            }
        }
    }
}
