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
            TreeListView()
        }
        .navigationTitle(forest.name)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink(destination: TreeAddView(forest: forest)) {
                    Image(systemName: "plus")
                        .font(.Bold.title3)
                        .foregroundStyle(.green)
                }
            }
        }
    }
}
