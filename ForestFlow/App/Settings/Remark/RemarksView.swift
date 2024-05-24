//
//  RemarkAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct RemarksView: View {
    
    @Environment(\.modelContext) var context
    
    @State var showModifyView: Bool = false
    @State private var showAlert: Bool = false
    @State private var remark: Remark?
    
    // MARK: - Query
    @Query var remarks: [Remark]

    var body: some View {
        VStack {
            if remarks.isEmpty {
                ContentUnavailableView(
                    "Noch keine Bemerkung angelegt",
                    systemImage: "text.bubble.fill" ,
                    description: Text("Erstelle eine neue Bemerkung indem du auf das + drückst.")
                )
            } else {
                List {
                    ForEach(remarks, id: \.id) { remark in
                        Button {
                            self.remark = remark
                        } label: {
                            Text(remark.name)
                                .font(.Bold.title)
                        }
                        .swipeActions {
                            Button {
                                if remark.canDelete() != nil {
                                    showAlert.toggle()
                                } else {
                                    context.delete(remark)
                                }
                            } label: {
                                Text("Delete")
                            }
                            .tint(remark.canDelete() != nil ? .gray : .red)
                        }
                    }
                }
            }
        }
        .navigationTitle("Bemerkungen")
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
        .sheet(item: $remark, onDismiss: { self.remark = nil }) { remark in
            NavigationStack {
                RemarkModifyView(remark: $remark, name: remark.name, isEditing: true)
            }
        }
        .sheet(isPresented: $showModifyView) {
            NavigationStack {
                RemarkModifyView(remark: .constant(nil), name: "", isEditing: false)
            }
        }
    }
}


