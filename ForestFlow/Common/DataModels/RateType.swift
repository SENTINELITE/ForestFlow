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
    var id: UUID
    var name: String
    @Relationship(deleteRule: .cascade) var rateValues: [RateValue]?
    @Relationship(deleteRule: .deny) var forests: [Forest]

    init(name: String, rateValues: [RateValue]?, forests: [Forest] = []) {
        self.id = UUID()
        self.name = name
        self.rateValues = rateValues
        self.forests = forests
    }
    
    func canDelete() -> DataModelDeleteError? {
         if forests.count > 0 {
             return DataModelDeleteError.isInUse
         }
         return nil
       }
}
