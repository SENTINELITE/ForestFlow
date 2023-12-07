//
//  AddNewTreeView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 20.05.23.
//

import SwiftUI

struct AddTreeView: View {
    @State private var treeNumber = ""
    @State private var selectedValue1 = 0
    @State private var stage = 0.0
    @State private var selectedValue3 = 0
    @State private var selectedValue4 = 0
    
    @State private var selectedKey: Int? = 12
    
    @State private var woodType: String = ""
    @State private var selectedIndex: Int? = 1
    
    @State private var currentLocation = false
    
    @Environment(\.modelContext) private var modelContext
    
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel = AddTreeViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Tree number", text: $treeNumber)
                    Toggle(isOn: $currentLocation) {
                        Text("Standort speichern")
                    }.tint(.accentColor)
                }
                Section {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 15) {
                        ForEach(Array(viewModel.kindOfWood.enumerated()), id: \.element) { index, item in
                            Circle()
                                .foregroundColor(.accentColor)
                                .opacity(0.7)
                                .frame(width: 55, height: 55)
                                .overlay(
                                    Text(item)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(selectedIndex == index ? Color.brown : Color.clear, lineWidth: 3)
                                        .padding(-5)
                                    
                                )
                                .onTapGesture {
                                    woodType = item
                                    print(woodType)
                                    selectedIndex = index
                                    print(selectedIndex ?? "")
                                }
                        }
                    }
                }
                Section {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 15) {
                        ForEach(viewModel.longTariff.sorted(by: <), id: \.key) { key, value in
                            Circle()
                                .foregroundColor(.accentColor)
                                .opacity(0.7)
                                .frame(width: 55, height: 55)
                                .overlay(
                                    Text("\(key)")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(selectedKey == key ? Color.brown : Color.clear, lineWidth: 3)
                                        .padding(-5)
                                    
                                )
                                .onTapGesture {
                                    stage = value
                                    print(stage)
                                    selectedKey = key
                                }
                        }
                    }
                    HStack {
                        Text("Volumen")
                        Spacer()
                        Text("\(stage, specifier: "%.2f")m3")
                            .foregroundColor(.gray)
                    }
                    
                }
                Section {
                    Picker("Waldbesitzer", selection: $selectedValue3) {
                        Text("Waldbesiter A").tag(0)
                        Text("Waldbesitzer B").tag(1)
                        Text("Waldbesitzer C").tag(2)
                    }
                    Picker("Bemerkung", selection: $selectedValue4) {
                        Text("QB Querbaum").tag(0)
                        Text("Stumpen").tag(1)
                        Text("Heli").tag(2)
                        Text("Bodenzug").tag(3)
                        Text("Ohne Verwertung").tag(4)
                        Text("Forstschutz A").tag(5)
                        Text("Forstschutz B").tag(6)
                        Text("Forstschutz C").tag(7)
                        Text("Keine Bemerkung").tag(8)
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        let tree = TreeElement(treeNumber: Int16(treeNumber) ?? 0, woodType: woodType, stage: stage, forestOwner: Int16(selectedValue3), saveLocation: currentLocation, currentLocation: 0.0, comments: Int16(selectedValue4))
                        modelContext.insert(tree)
                        dismiss()
                    } label: {
                        Text("Fertig")
                            .fontWeight(.bold)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Baum erfassen")
                        .fontWeight(.medium)
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                        print("Cancel tapped")
                    } label: {
                        Text("Abbrechen")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        print("New")
                    } label: {
                        HStack {
                            Image(systemName: "square.and.pencil")
                            Text("Nächster Eintrag")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddTreeView()
        .modelContainer(for: TreeElement.self)
}
