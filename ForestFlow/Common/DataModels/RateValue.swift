//
//  RateValue.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import Foundation
import SwiftData

@Model
class RateValue: Selectable {
    var stage: Int
    var volume: Float
    var name: String

    init(stage: Int, volume: Float) {
        self.stage = stage
        self.volume = volume
        self.name = stage.description
    }
}
