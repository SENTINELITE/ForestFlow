//
//  Forest.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import Foundation
import SwiftData

@Model
class Forest {
    var name: String
    var location: String
    var forestOwner: ForestOwner?
    var rate: String // TarifEnum
    var cropLoss: Int
    @Relationship(deleteRule: .cascade) var trees: [Tree]

    init(
        name: String,
        location: String,
        forestOwner: ForestOwner? = nil,
        rate: String,
        cropLoss: Int,
        trees: [Tree] = []
    ) {
        self.name = name
        self.location = location
        self.forestOwner = forestOwner
        self.rate = rate
        self.cropLoss = cropLoss
        self.trees = trees
    }
}
