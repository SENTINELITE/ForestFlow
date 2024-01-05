//
//  WoodType.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import Foundation
import SwiftData

@Model
class WoodType: Selectable {
    var name: String
    var trees: [Tree]

    init(name: String, trees: [Tree] = []) {
        self.name = name
        self.trees = trees
    }
}
