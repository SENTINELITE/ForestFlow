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
        .navigationDestination(for: Tree.self, destination: { tree in
            TreeDetailView(tree: tree)
        })
        .toolbar(.hidden, for: .tabBar)
    }
}
