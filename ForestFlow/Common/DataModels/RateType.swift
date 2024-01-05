//
//  RateType.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import Foundation
import SwiftData

@Model
class RateType {
    let name: String
    var forests: [Forest]
    var rateValues: [RateValue]

    init(name: String, forests: [Forest] = [], rateValues: [RateValue] = []) {
        self.name = name
        self.forests = forests
        self.rateValues = rateValues
    }
}
