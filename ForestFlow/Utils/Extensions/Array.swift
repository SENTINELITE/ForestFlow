//
//  Array.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 13.03.24.
//

import Foundation

extension Array where Element: Equatable {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    // Remove first collection element that is equal to the given `object`:
        mutating func remove(object: Element) {
            guard let index = firstIndex(of: object) else {return}
            remove(at: index)
        }

    
}
