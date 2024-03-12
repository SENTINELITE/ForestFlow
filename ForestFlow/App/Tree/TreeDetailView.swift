//
//  TreeDetailView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI

struct TreeDetailView: View {
    @Bindable var tree: Tree
    
    var body: some View {
        Form {
            Section("Bauminformationen") {
                Text(tree.woodType.name)
                Text("\(String(describing: tree.rateValue))")
            }
            Section {
                Text(tree.remark.name)
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}


