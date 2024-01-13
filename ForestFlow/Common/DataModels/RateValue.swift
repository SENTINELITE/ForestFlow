//
//  RateValue.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import Foundation
import SwiftData

@Model
class RateValue {
    var stage: Int
    var volume: Float
    @Relationship() var rateTypes: [RateType]
    
    init(stage: Int, volume: Float, rateTypes: [RateType] = []) {
        self.stage = stage
        self.volume = volume
        self.rateTypes = rateTypes
    }
    
}
