//
//  ForestOwnerAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct ForestOwnersView: View {
    @Query var forestOwners: [ForestOwner]
    @Environment(\.modelContext) var context
    
    @State private var showModifyView = false
    @State private var forestOwner: ForestOwner?
    
    var body: some View {
        List {
            ForEach(forestOwners, id: \.self) { forestOwner in
                Button {
                    self.forestOwner = forestOwner
                } label: {
                    Text(forestOwner.name)
                        .font(.Bold.title)
                }
            }
            .onDelete(perform: deleteModel)
        }
        .navigationTitle("Waldbesitzer")
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PlusButton()
                    .button {
                        showModifyView.toggle()
                    }
            }
        }
        .sheet(item: $forestOwner, onDismiss: { self.forestOwner = nil }) { forestOwner in
            ForestOwnerModifyView(forestOwner: $forestOwner, name: forestOwner.name, isEditing: true)
                .presentationDetents([.height(250.0)])
        }
        .sheet(isPresented: $showModifyView) {
            ForestOwnerModifyView(forestOwner: .constant(nil), name: "", isEditing: false)
                .presentationDetents([.height(250.0)])
        }
    }

    func deleteModel(_ indexSet: IndexSet) {
        for index in indexSet {
            let model = forestOwners[index]
            context.delete(model)
        }
    }
}

