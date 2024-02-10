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
                        }
                    }
                }
            }
            .navigationTitle("Waldliste")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: ForestAddView()) {
                        PlusButton()
                    }
                }
            }
            .navigationDestination(for: Forest.self) { forest in
                ForestDetailView(forest: forest)
            }
        }
    }
}

#Preview {
    ForestListView()
}
