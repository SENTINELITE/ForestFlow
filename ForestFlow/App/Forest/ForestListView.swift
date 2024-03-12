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
    
    @State var forest: Forest?

    var body: some View {
        NavigationStack {
            ZStack {
                if forests.isEmpty {
                    ContentUnavailableView(
                        "Noch kein Wald angelegt",
                        systemImage: "tree.circle.fill",
                        description: Text("Erstelle einen neuen Wald indem du auf das + drückst.")
                    )
                } else {
                    List {
                        ForEach(forests, id: \.self) { forest in
                            NavigationLink(value: forest) {
                                ForestCell(forest: forest)
                            }
                            .contextMenu {
                                Button {
                                    self.forest = forest
                                } label: {
                                    Label("Bearbeiten", systemImage: "pencil")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Waldliste")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(value: true) {
                        PlusButton()
                    }
                }
            }
            .navigationDestination(for: Forest.self) { forest in
                ForestDetailView(forest: forest)
            }
            .navigationDestination(for: Bool.self) { _ in
                ForestModifyView(forest: .constant(nil), name: "", location: "", cropLoss: 12, isEditing: false)
            }
            .navigationDestination(item: $forest) { forest in
                ForestModifyView(forest: .constant(forest), name: forest.name, location: forest.location, rateType: forest.rateType, cropLoss: forest.cropLoss, isEditing: true)
            }
        }
    }
}

#Preview {
    ForestListView()
}
