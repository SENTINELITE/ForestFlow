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
                        VStack(alignment: .leading) {
                            Text("\(tree.woodType.name)")
                                .font(.Bold.regular)
                            
                            HStack {
                                Text("Stufe: \(tree.rateValue?.stage ?? 0)")
                                    .font(.Bold.small)
                                
                                Text("Volumen: \(tree.rateValue?.volume.string(decimalPlaces: 2) ?? "0.0" )")
                                    .font(.Bold.small)
                            }
                        }
                    }
                }
            }
        }
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
