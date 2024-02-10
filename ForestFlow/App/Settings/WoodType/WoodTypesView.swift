//
//  WoodTypeAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct WoodTypesView: View {
    @Query private var woodTypes: [WoodType]
    @Environment(\.modelContext) var context
    
    @State private var showModifyView = false
    @State private var woodType: WoodType?
    
    var body: some View {
        List {
            ForEach(woodTypes, id: \.self) { woodType in
                Button {
                    self.woodType = woodType
                } label: {
                    Text(woodType.name)
                        .font(.Bold.title)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        context.delete(woodType)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
        .navigationTitle("Baumart")
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PlusButton()
                    .button {
                        showModifyView.toggle()
                    }
            }
        }
        .sheet(item: $woodType, onDismiss: { self.woodType = nil }) { _ in
            WoodTypeModifyView(woodType: $woodType, name: woodType?.name ?? "", isEditing: true)
                .presentationDetents([.height(250.0)])
        }
        .sheet(isPresented: $showModifyView) {
            WoodTypeModifyView(woodType: .constant(nil), name: "", isEditing: false)
                .presentationDetents([.height(250.0)])
        }
    }
}

