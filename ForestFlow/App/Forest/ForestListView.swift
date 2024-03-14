//
//  ForestListView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct ForestListView: View {

    @Query private var forests: [Forest]

    var body: some View {
        NavigationStack {
            VStack {
                if forests.isNotEmpty {
                    List {
                        ForEach(forests, id: \.self) { forest in
                            NavigationLink(value: ForestShow(forest: forest, editing: false)) {
                                ForestCell(forest: forest)
                            }
                            .contextMenu {
                                NavigationLink(value: ForestShow(forest: forest, editing: true)) {
                                    Label("Bearbeiten", systemImage: "pencil")
                                }
                            }
                        }
                    }
                } else {
                    ContentUnavailableView(
                        "Noch kein Wald angelegt",
                        systemImage: "tree.circle.fill",
                        description: Text("Erstelle einen neuen Wald indem du auf das + drückst.")
                    )
                }
            }
            .navigationTitle("Waldliste")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(value: ForestShow(forest: nil, editing: false)) {
                        PlusButton()
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
        }
    }
}
