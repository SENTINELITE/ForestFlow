//
//  ListModel.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 22.07.23.
//
import SwiftData
import Foundation

@Model
class ListElement {
    @Attribute(.unique) var name: String
    var location: String
    var forestOwners: String
    var tariff: Int16
    var cropLoss: Int16
    
    
    @Relationship(deleteRule: .cascade) var treeElement: [TreeElement]
    
    
    init(name: String, location: String, forestOwners: String, tariff: Int16, cropLoss: Int16, treeElement: [TreeElement] = []) {
        self.name = name
        self.location = location
        self.forestOwners = forestOwners
        self.tariff = tariff
        self.cropLoss = cropLoss
        self.treeElement = treeElement
    }
}
