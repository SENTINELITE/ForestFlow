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
                Text("\(tree.stage) \(tree.woodType)")
            }
        }
    }
}
