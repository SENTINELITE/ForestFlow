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
    var woodType: WoodType 
    var stage: Int
    var latitude: CGFloat
    var longitude: CGFloat
    var forest: Forest?
    var remark: Remark

    init(woodType: WoodType, stage: Int, lat: CGFloat, long: CGFloat, forest: Forest? = nil, remark: Remark) {
        self.woodType = woodType
        self.stage = stage
        self.latitude = lat
        self.longitude = long
        self.forest = forest
        self.remark = remark
    }
}
