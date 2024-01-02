//
//  TreeListView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct TreeListView: View {

    @Query var trees: [Tree]

    var body: some View {
        List {
            ForEach(trees, id: \.self) { tree in
                Text("\(tree.stage) \(tree.woodType)")
            }
        }
    }
}

#Preview {
    TreeListView()
}
