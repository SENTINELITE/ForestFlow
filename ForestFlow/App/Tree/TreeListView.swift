//
//  TreeListView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct TreeListView: View {
    @Environment(\.modelContext) var context
    var forest: Forest
    
    var body: some View {
        VStack {
            if forest.trees.isEmpty {
                ContentUnavailableView(
                    "Noch kein Baum angelegt",
                    systemImage: "tree.circle.fill",
                    description: Text("Erstelle einen neuen Baum indem du auf das + drückst.")
                )
            } else {
                List {
                    ForEach(forest.trees, id: \.id) { tree in
                        NavigationLink(value: TreeShow(forest: nil, tree: tree, editing: false)) {
                            HStack {
                                Text("\(tree.woodType.name)")
                                    .font(.Bold.title3)
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 10.0) {
                                    Text("Stufe: \(tree.rateValue?.stage ?? 0)")
                                        .font(.Regular.small)
                                        .foregroundStyle(.gray)
                                    
                                    Text("Volumen: \(tree.rateValue?.volume.string(decimalPlaces: 2) ?? "0.0" )")
                                        .font(.Regular.small)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.horizontal, 10.0)
                            }
                            .padding(10.0)
                        }
                        .contextMenu {
                            Button(role: .destructive) {
                                context.delete(tree)
                            } label: {
                                Label("Löschen", systemImage: "trash")
                                    .tint(.red)
                            }
                            NavigationLink(value: TreeShow(forest: nil, tree: tree, editing: true)) {
                                Label("Bearbeiten", systemImage: "pencil")
                            }
                        }
                    }
                    .onDelete(perform: deleteModel)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: TreeShow(forest: forest, tree: nil, editing: false)) {
                    Image(systemName: "plus")
                }
            }
        }
        .navigationDestination(for: TreeShow.self) { show in
            if let forest = show.forest {
                TreeModifyView(forest: .constant(forest), tree: .constant(nil), isEditing: false)
            }
            
            if let tree = show.tree {
                if show.editing {
                    TreeModifyView(forest: .constant(nil), tree: .constant(tree), isEditing: true)
                } else {
                    TreeDetailView(tree: tree)
                }
            }
        }
    }
    func deleteModel(_ indexSet: IndexSet) {
        for index in indexSet {
            let model = forest.trees[index]
            context.delete(model)
        }
    }
}
