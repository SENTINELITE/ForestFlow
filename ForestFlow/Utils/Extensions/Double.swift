//
//  Double.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 09.03.2024.
//

import Foundation

extension Double {
    func string(decimalPlaces: Int = 10) -> String {
        return String(format: "%.\(decimalPlaces)f", self)
    }
}
