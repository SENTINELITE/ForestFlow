//
//  TreeListView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct TreeListView: View {

    let forest: Forest

    var body: some View {
        List {
            ForEach(forest.trees, id: \.self) { tree in
                VStack(alignment: .leading, spacing: 5.0) {
                    NavigationLink(value: tree) {
                        Text("\(tree.stage) \(tree.woodType.name)")
                            .font(.Bold.regular)

                        Text("Lat: \(tree.latitude) - Long: \(tree.longitude)")
                            .font(.Regular.small)
                    }
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(value: "true") {
                    PlusButton()
                }
            }
        }
        .navigationDestination(for: Tree.self) { tree in
            TreeDetailView(tree: tree)
        }
        .navigationDestination(for: String.self) { _ in
            TreeAddView(forest: forest)
        }
    }
}
