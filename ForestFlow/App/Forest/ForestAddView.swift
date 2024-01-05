//
//  ForestAddView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct ForestAddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @State var name: String = ""
    @State var location: String = ""
    @State var rateType: RateType = .short
    @State var cropLoss: Int = 12

    var body: some View {
        VStack {
            Form {
                Section("Informationen") {
                    TextField("Name", text: $name)
                    TextField("Ort", text: $location)
                }

                Section("Tarifeinstellung") {
                    Picker("Tarif", selection: $rateType) {
                        ForEach(RateType.allCases, id: \.self) { rate in
                            Text(rate.rawValue)
                        }
                    }

                    Picker("Ernteverlust", selection: $cropLoss) {
                        ForEach(5...20, id: \.self) { percent in
                            Text("\(percent) %")
                        }
                    }
                }
            }

            Spacer()

            Text("Anlegen")
                .font(.Bold.title2)
                .foregroundStyle(Color.accentColor)
                .padding()
                .button {
                    self.saveForest()
                }
        }
        .toolbar(.hidden, for: .tabBar)
    }

    func saveForest() {
        let forest = Forest(name: name, location: location, rate: rateType.rawValue, cropLoss: cropLoss)
        context.insert(forest)
        dismiss()
    }
}
