//
//  TreeModel.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 22.07.23.
//
import SwiftData
import Foundation

@Model
class TreeElement {
    @Attribute(.unique) var treeNumber: Int16
    var woodType: String
    var stage: Double
    var forestOwner: Int16
    var saveLocation: Bool
    var currentLocation: Float32
    var comments: Int16
    
    
    var listElement: ListElement?  // to-one relationships is always optional
    
    init(treeNumber: Int16, woodType: String, stage: Double, forestOwner: Int16, saveLocation: Bool, currentLocation: Float32, comments: Int16, listElement: ListElement? = nil) {
        self.treeNumber = treeNumber
        self.woodType = woodType
        self.stage = stage
        self.forestOwner = forestOwner
        self.saveLocation = saveLocation
        self.currentLocation = currentLocation
        self.comments = comments
        self.listElement = listElement
    }
}
