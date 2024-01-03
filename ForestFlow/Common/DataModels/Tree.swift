//
//  Tree.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import Foundation
import SwiftData

@Model
class Tree {
    var woodType: String //WoodType Enum
    var stage: Int
    var latitude: CGFloat
    var longitude: CGFloat
    var forest: Forest?

    init(woodType: String, stage: Int, lat: CGFloat, long: CGFloat, forest: Forest? = nil) {
        self.woodType = woodType
        self.stage = stage
        self.latitude = lat
        self.longitude = long
        self.forest = forest
    }
}
