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

    @Query var rateTypes: [RateType]
    
    @Binding var forest: Forest?

    @State var name: String
    @State var location: String
    @State var rateType: RateType?
    @State var cropLoss: Int
    
    let isEditing: Bool

    var body: some View {
        VStack {
            Form {
                Section("Informationen") {
                    TextField("Name", text: $name)
                    TextField("Ort", text: $location)
                }

                Section("Tarifeinstellung") {
                    CircleSelection(items: rateTypes, selected: $rateType)

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
        .onAppear {
            if isEditing {
                rateType = forest?.rateType
            } else {
                rateType = rateTypes.first
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }

    func saveForest() {
        if isEditing {
            forest?.name = name
            forest?.location = location
            forest?.rateType = rateType
            forest?.cropLoss = cropLoss
        } else {
            let forest = Forest(name: name, location: location, rateType: rateType, cropLoss: cropLoss)
            context.insert(forest)
        }
        dismiss()
    }
}
