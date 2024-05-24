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
    let id: UUID
    var stage: Int
    var volume: Double
    var name: String
    var rateType: RateType?
    @Relationship(deleteRule: .deny) var trees: [Tree]

    init(stage: Int, volume: Double, rateType: RateType? = nil, trees: [Tree] = []) {
        self.id = UUID()
        self.stage = stage
        self.volume = volume
        self.name = stage.description  
        self.rateType = rateType
        self.trees = trees
    }
    
    func canDelete() -> DataModelDeleteError? {
         if trees.count > 0 {
             return DataModelDeleteError.isInUse
         }
         return nil
       }
}
