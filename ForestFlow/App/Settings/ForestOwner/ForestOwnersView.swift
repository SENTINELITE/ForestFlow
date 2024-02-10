//
//  ForestOwnerAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct ForestOwnersView: View {
    @Query private var forestOwners: [ForestOwner]
    @Environment(\.modelContext) var context
    
    @State private var showModifyView = false
    @State private var forestOwner: ForestOwner?
    
    var body: some View {
        List {
            ForEach(forestOwners, id: \.self) { forestOwner in
                Button {
                    self.forestOwner = forestOwner
                    dump(self.forestOwner)
                    print(self.forestOwner)
                } label: {
                    Text(forestOwner.name)
                        .font(.Bold.title)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        context.delete(forestOwner)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
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
        .sheet(item: $forestOwner, onDismiss: { self.forestOwner = nil }) { _ in
            ForestOwnerModifyView(forestOwner: $forestOwner, name: forestOwner?.name ?? "", isEditing: true)
                .presentationDetents([.height(250.0)])
        }
        .sheet(isPresented: $showModifyView) {
            ForestOwnerModifyView(forestOwner: .constant(nil), name: "", isEditing: false)
                .presentationDetents([.height(250.0)])
        }
    }
}

