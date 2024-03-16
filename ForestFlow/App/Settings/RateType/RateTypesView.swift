//
//  RateTypeAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 13.01.2024.
//

import SwiftUI
import SwiftData

struct RateTypesView: View {
    @Query var rateTypes: [RateType]
    @Environment(\.modelContext) var context
    
    @State private var showModifyView = false
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            if rateTypes.isEmpty {
                ContentUnavailableView(
                    "Noch keine Tarife angelegt",
                    systemImage: "eurosign.arrow.circlepath" ,
                    description: Text("Erstelle einen neuen Tarif indem du auf das + drückst.")
                )
            } else {
                List {
                    ForEach(rateTypes, id: \.self) { rateType in
                        NavigationLink(value: rateType) {
                            Text(rateType.name)
                        }
                    }
                    .onDelete(perform: deleteModel)
                }
            }
        }
        .navigationTitle("Tarife")
        .navigationDestination(for: RateType.self) { rateType in
            RateTypeModifyView(rateType: .constant(rateType), rateValues: rateType.rateValues, name: rateType.name, isEditing: true)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PlusButton()
                    .button {
                        let rateType = RateType(name: "", rateValues: [])
                        context.insert(rateType)
                        path.append(rateType)
                    }
            }
        }
    }
    
    func deleteModel(_ indexSet: IndexSet) {
        for index in indexSet {
            let model = rateTypes[index]
            context.delete(model)
        }
    }
}


