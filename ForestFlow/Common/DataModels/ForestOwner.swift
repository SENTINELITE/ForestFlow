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
    let id: UUID
    var name: String
    @Relationship(deleteRule: .deny) var trees: [Tree]

    init(name: String, trees: [Tree] = []) {
        self.id = UUID()
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
