//
//  ForestOwner.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import Foundation
import SwiftData

@Model
class ForestOwner {
    var name: String
    @Relationship(deleteRule: .deny) var trees: [Tree]

    init(name: String, trees: [Tree] = []) {
        self.name = name
        self.trees = trees
    }
}
