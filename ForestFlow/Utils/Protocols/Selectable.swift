//
//  Selectable.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 05.01.24.
//

import Foundation

protocol Selectable: Hashable {
    var id: UUID { get }
    var name: String { get set }
}
