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
        List {
            ForEach(forests, id: \.self) { forest in
                NavigationLink(value: forest) {
                    ForestCell(forest: forest)
                }
            }
        }
        .navigationTitle("Waldlisten")
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink(destination: ForestAddView()) {
                    Image(systemName: "plus")
                        .font(.Bold.title3)
                        .foregroundStyle(.green)
                }
            }
        }
        .navigationDestination(for: Forest.self) { forest in
            ForestDetailView(forest: forest)
        }
    }
}

#Preview {
    ForestListView()
}
