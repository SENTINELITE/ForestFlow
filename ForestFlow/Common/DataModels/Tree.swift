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
    var rateValue: RateValue?
    var latitude: CGFloat
    var longitude: CGFloat
    var forest: Forest?
    var remark: Remark

    init(woodType: WoodType, rateValue: RateValue?, lat: CGFloat, long: CGFloat, forest: Forest? = nil, remark: Remark) {
        self.woodType = woodType
        self.rateValue = rateValue
        self.latitude = lat
        self.longitude = long
        self.forest = forest
        self.remark = remark
    }
}
