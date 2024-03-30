//
//  ForestCell.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI

struct ForestCell: View {
    let forest: Forest
    
    var totalVolume: Double {
       return calculateTotalValue()
    }
    
    func calculateTotalValue() -> Double {
        var rateValue: Double = 0.0
        forest.trees.forEach { tree in
            rateValue += tree.rateValue?.volume ?? 0.0
        }
        return rateValue
    }
    
    var body: some View {
        HStack {
            Text(forest.name)
                .font(.Bold.title3)
            
            Spacer()
            
            VStack(spacing: 10.0) {
                Text("\(forest.trees.count) \(forest.trees.count > 1 ? "Bäume" : "Baum")")
                    .font(.Regular.small)
                    .foregroundStyle(.gray)
                
                Text(totalVolume.string(decimalPlaces: 2) + " m3")
                    .font(.Regular.small)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 10.0)
        }
        .padding(10.0)
    }
}
