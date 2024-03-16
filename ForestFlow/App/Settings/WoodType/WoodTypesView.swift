//
//  WoodTypeAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct WoodTypesView: View {
    @Query var woodTypes: [WoodType]
    @Environment(\.modelContext) var context
    
    @State private var showModifyView = false
    @State private var woodType: WoodType?
    
    var body: some View {
        VStack {
            if woodTypes.isEmpty {
                ContentUnavailableView(
                    "Noch keine Baumart angelegt",
                    systemImage: "tree.circle.fill" ,
                    description: Text("Erstelle eine neue Baumart indem du auf das + drückst.")
                )
            } else {
                List {
                    ForEach(woodTypes, id: \.self) { woodType in
                        Button {
                            self.woodType = woodType
                        } label: {
                            Text(woodType.name)
                                .font(.Bold.title)
                        }
                    }
                    .onDelete(perform: deleteModel)
                }
            }
        }
        .navigationTitle("Baumart")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PlusButton()
                    .button {
                        showModifyView.toggle()
                    }
            }
        }
        .sheet(item: $woodType, onDismiss: { self.woodType = nil }) { woodType in
            WoodTypeModifyView(woodType: $woodType, name: woodType.name, isEditing: true)
                .presentationDetents([.height(250.0)])
        }
        .sheet(isPresented: $showModifyView) {
            WoodTypeModifyView(woodType: .constant(nil), name: "", isEditing: false)
                .presentationDetents([.height(250.0)])
        }
    }
    
    func deleteModel(_ indexSet: IndexSet) {
        for index in indexSet {
            let model = woodTypes[index]
            context.delete(model)
        }
    }
}

