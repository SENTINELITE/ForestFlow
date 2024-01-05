//
//  WoodType.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import Foundation
import SwiftData

@Model
class WoodType {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
