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

    init(name: String, forests: [Forest] = []) {
        self.name = name
        self.forests = forests
    }
}
