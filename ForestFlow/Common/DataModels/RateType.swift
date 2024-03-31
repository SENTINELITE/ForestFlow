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
    @Relationship(deleteRule: .deny) var forests: [Forest]

    init(name: String, rateValues: [RateValue] = [], forests: [Forest] = []) {
        self.name = name
        self.rateValues = rateValues
        self.forests = forests
    }
}
