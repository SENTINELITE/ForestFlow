//
//  ForestOwner.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import Foundation
import SwiftData

@Model
class ForestOwner {
    var name: String
    var forests: [Forest]

    init(name: String, forests: [Forest] = []) {
        self.name = name
        self.forests = forests
    }
}
