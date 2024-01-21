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
                Text("\(tree.stage)")
            }
            Section {
                Text(tree.remark.name)
            }
        }
    }
}


