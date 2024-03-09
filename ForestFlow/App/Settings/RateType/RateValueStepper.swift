//
//  RateValueStepper.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 09.03.2024.
//
import SwiftUI

struct RateValueStepper: View {

    // MARK: - Binding
    @Binding var rateValue: RateValue

    // MARK: - Body
    var body: some View {
        HStack {
            Text(rateValue.stage.description)
                .font(.Bold.title)
            
            Spacer()

            VStack(alignment: .trailing) {
                Text(rateValue.volume.string(decimalPlaces: 2))
                    .font(.Bold.regular)

                Stepper("", value: $rateValue.volume, in: 0...50, step: 0.1)
            }
        }
    }
}
