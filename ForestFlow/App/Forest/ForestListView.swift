//
//  ForestListView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct ForestListView: View {
    @Environment(\.modelContext) var context
    @Query private var forests: [Forest]
    
    @State private var isShowingInfoSheet: Bool = false
    @State private var forest: Forest?

    var body: some View {
        NavigationStack {
            VStack {
                if forests.isNotEmpty {
                    List {
                        ForEach(forests, id: \.id) { forest in
                            NavigationLink(value: ForestShow(forest: forest, editing: false)) {
                                ForestCell(forest: forest)
                            }
                            .contextMenu {
                                Button(role: .destructive) {
                                    context.delete(forest)
                                } label: {
                                    Label("Löschen", systemImage: "trash")
                                        .tint(.red)
                                }
                                NavigationLink(value: ForestShow(forest: forest, editing: true)) {
                                    Label("Bearbeiten", systemImage: "pencil")
                                }
                                
                                Button {
                                    isShowingInfoSheet.toggle()
                                    self.forest = forest
                                } label: {
                                    Label("Infos zur Liste anzeigen", systemImage: "info.circle")
                                }
                            }
                        }
                        .onDelete(perform: deleteModel)
                    }
                } else {
                    ContentUnavailableView(
                        "Noch kein Wald angelegt",
                        systemImage: "square.stack",
                        description: Text("Erstelle einen neuen Wald indem du auf das + drückst.")
                    )
                }
            }
            .navigationTitle("Anzeichnungsliste")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: ForestShow(forest: nil, editing: false)) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: ForestShow.self) { show in
                if let forest = show.forest {
                    if show.editing {
                        ForestModifyView(
                            forest: .constant(forest),
                            name: forest.name,
                            location: forest.location,
                            rateType: forest.rateType,
                            cropLoss: forest.cropLoss,
                            isEditing: show.editing
                        )
                    } else {
                        ForestDetailView(forest: forest)
                    }
                } else {
                    ForestModifyView(forest: .constant(nil), name: "", location: "", cropLoss: 12, isEditing: show.editing)
                }
            }
            .sheet(isPresented: $isShowingInfoSheet, onDismiss: {
                forest = nil
            }) {
                NavigationStack {
                    AboutForestView()
                }
                .presentationDetents([.height(250), .medium])
            }
        }
    }
    
    func deleteModel(_ indexSet: IndexSet) {
        for index in indexSet {
            let model = forests[index]
            context.delete(model)
        }
    }
}
