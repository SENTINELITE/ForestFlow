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

    @Bindable var forest: Forest

    @State var woodType: WoodType = .div
    @State var stage: Int = 1
    @State var locationManager: LocationManager = .init()

    var body: some View {
        VStack {
            Form {
                Section("Bauminformationen") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 15) {
                        ForEach(WoodType.allCases, id: \.self) { type in
                            Circle()
                                .foregroundColor(.accentColor)
                                .opacity(0.7)
                                .frame(width: 55, height: 55)
                                .overlay(
                                    Text(type.rawValue)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(woodType == type ? Color.brown : Color.clear, lineWidth: 3)
                                        .padding(-5)
                                    
                                )
                                .onTapGesture {
                                    woodType = type
                                    print(woodType)
                                }
                        }
                    }
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
                .foregroundStyle(Color.accentColor)
                .padding()
                .button {
                    self.saveTree()
                }
        }
        .onAppear {
            locationManager.request()
        }
    }

    func saveTree() {
        guard let location = locationManager.location else { return }
        let tree = Tree(woodType: woodType.rawValue, stage: stage, lat: location.latitude, long: location.longitude, forest: forest)
        context.insert(forest)
        forest.trees.append(tree)
        dismiss()
    }
}
