//
//  WoodType.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import Foundation
import SwiftData

@Model
class WoodType: Selectable {
    var name: String
    @Relationship(deleteRule: .deny) var trees: [Tree]

    init(name: String, trees: [Tree] = []) {
        self.name = name
        self.trees = trees
    }
    
    func canDelete() -> DataModelDeleteError? {
         if trees.count > 0 {
             return DataModelDeleteError.isInUse
         }
         return nil
       }
}
