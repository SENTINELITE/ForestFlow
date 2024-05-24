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
    
    @State private var showModifyView: Bool = false
    @State private var showAlert: Bool = false
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
                    ForEach(woodTypes, id: \.id) { woodType in
                        Button {
                            self.woodType = woodType
                        } label: {
                            Text(woodType.name)
                                .font(.Bold.title)
                        }
                        .swipeActions {
                            Button {
                                if woodType.canDelete() != nil {
                                    showAlert.toggle()
                                } else {
                                    context.delete(woodType)
                                }
                            } label: {
                                Text("Delete")
                            }
                            .tint(woodType.canDelete() != nil ? .gray : .red)
                        }
                    }
                }
            }
        }
        .navigationTitle("Baumart")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "plus")
                    .button {
                        showModifyView.toggle()
                    }
            }
        }
        .alert("Löschen nicht möglich", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Dieses Element kann nicht gelöscht werden, da es in verwendung ist")
        }
        .sheet(item: $woodType, onDismiss: { self.woodType = nil }) { woodType in
            NavigationStack {
                WoodTypeModifyView(woodType: $woodType, name: woodType.name, isEditing: true)
            }
        }
        .sheet(isPresented: $showModifyView) {
            NavigationStack {
                WoodTypeModifyView(woodType: .constant(nil), name: "", isEditing: false)
            }
        }
    }
}

