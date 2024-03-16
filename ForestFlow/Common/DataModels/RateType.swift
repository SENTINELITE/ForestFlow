//
//  RateType.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import Foundation
import SwiftData

@Model
class RateType: Selectable {
    var name: String
    var rateValues: [RateValue]

    init(name: String, rateValues: [RateValue] = []) {
        self.name = name
        self.rateValues = rateValues
    }
}
