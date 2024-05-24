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
    
    @State private var showModifyView: Bool = false
    @State private var showAlert: Bool = false
    @State private var forestOwner: ForestOwner?
    
    var body: some View {
        VStack {
            if forestOwners.isEmpty {
                ContentUnavailableView(
                    "Noch kein Waldbesitzer angelegt",
                    systemImage: "person.circle.fill" ,
                    description: Text("Erstelle einen neuen Waldbesitzer indem du auf das + drückst.")
                )
            } else {
                List {
                    ForEach(forestOwners, id: \.id) { forestOwner in
                        Button {
                            self.forestOwner = forestOwner
                        } label: {
                            Text(forestOwner.name)
                                .font(.Bold.title)
                        }
                        .swipeActions {
                            Button {
                                if forestOwner.canDelete() != nil {
                                    showAlert.toggle()
                                } else {
                                    context.delete(forestOwner)
                                }
                            } label: {
                                Text("Delete")
                            }
                            .tint(forestOwner.canDelete() != nil ? .gray : .red)
                        }
                    }
                }
            }
        }
        .navigationTitle("Waldbesitzer")
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
        .sheet(item: $forestOwner, onDismiss: { self.forestOwner = nil }) { forestOwner in
            NavigationStack {
                ForestOwnerModifyView(forestOwner: $forestOwner, name: forestOwner.name, isEditing: true)
            }
        }
        .sheet(isPresented: $showModifyView) {
            NavigationStack {
                ForestOwnerModifyView(forestOwner: .constant(nil), name: "", isEditing: false)
            }
        }
    }
}

