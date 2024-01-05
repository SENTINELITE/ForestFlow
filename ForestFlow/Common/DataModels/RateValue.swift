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
    var number: Int
    var volume: Float
    @Relationship() var rateTypes: [RateType]
    
    init(number: Int, volume: Float, rateTypes: [RateType] = []) {
        self.number = number
        self.volume = volume
        self.rateTypes = rateTypes
    }
    
}
