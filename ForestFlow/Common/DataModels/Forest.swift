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
    var rateType: RateType?
    var cropLoss: Int
    @Relationship(deleteRule: .cascade, inverse: \Tree.forest) var trees: [Tree]

    init(
        name: String,
        location: String,
        rateType: RateType? = nil,
        cropLoss: Int,
        trees: [Tree] = []
    ) {
        self.name = name
        self.location = location
        self.rateType = rateType
        self.cropLoss = cropLoss
        self.trees = trees
    }
}
