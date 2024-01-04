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
        .overlay(alignment: .bottomTrailing) {
            NavigationLink(destination: TreeAddView(forest: forest)) {
                PlusButton()
            }
        }
    }
}
