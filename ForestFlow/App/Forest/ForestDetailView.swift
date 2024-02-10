//
//  ForestDetailView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI

struct ForestDetailView: View {

    let forest: Forest

    var body: some View {
        VStack {
            TreeListView(forest: forest)
        }
        .navigationTitle(forest.name)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(destination: TreeAddView(forest: forest)) {
                    PlusButton()
                }
            }
        }
    }
}
