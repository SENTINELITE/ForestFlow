//
//  TreeAddView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI

struct TreeAddView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    let forest: Forest

    @State var woodType: WoodType = .div
    @State var stage: Int = 1

    var body: some View {
        VStack {
            Form {
                Section("Bauminformationen") {
                    Picker("Baumart", selection: $woodType) {
                        ForEach(WoodType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }

                    Picker("Baumstufe", selection: $stage) {
                        ForEach(0...17, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
            }

            Spacer()

            Text("Hinzufügen")
                .font(.Bold.title2)
                .foregroundStyle(.green)
                .padding()
                .button {
                    self.saveTree()
                }
        }
    }

    func saveTree() {
        let tree = Tree(woodType: woodType.rawValue, stage: stage, forest: forest)
        context.insert(forest)
        dismiss()
    }
}
