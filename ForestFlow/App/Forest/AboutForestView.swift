//
//  AboutForestView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 26.05.2024.
//

import SwiftUI

struct AboutForestView: View {
    var forest: Forest?
    @Environment(\.dismiss) var dismiss
    
    var totalVolume: Double {
        calculateTotalValue(withHarvestLoss: false)
    }
    
    var volumeWithHarvestLoss: Double {
        calculateTotalValue(withHarvestLoss: true)
    }
    
    var middleTrunk: Double {
        calculateMiddleTrunk(harvestLossVolume: volumeWithHarvestLoss)
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text("Anzahl Bäume")
                    
                    Spacer()
                    
                    Text("\(forest?.trees.count ?? 0) \(forest?.trees.count ?? 0 > 1 ? "Bäume" : "Baum")")
                        .font(.Regular.small)
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Total Volumen")
                    
                    Spacer()
                    
                    Text(totalVolume.string(decimalPlaces: 2) + " m3")
                        .font(.Regular.small)
                        .foregroundStyle(.gray)
                }
                HStack {
                    Text("Erntefestmeter")
                    
                    Spacer()
                    
                    Text(volumeWithHarvestLoss.string(decimalPlaces: 2) + " m3")
                        .font(.Regular.small)
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Mittelstamm")
                    
                    Spacer()
                    
                    Text(middleTrunk.string(decimalPlaces: 2) + " m3")
                        .font(.Regular.small)
                        .foregroundStyle(.gray)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Infos für \(forest?.name ?? "") Liste")
                        .font(.headline)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.accent)
                    }
                }
            }
        }
        .padding(0)
    }
    
    func calculateMiddleTrunk(harvestLossVolume: Double) -> Double {
        harvestLossVolume / Double(forest?.trees.count ?? 0)
    }
    
    func calculateTotalValue(withHarvestLoss: Bool) -> Double {
        var rateValue: Double = 0.0
        var interimTotal: Double = 0.0
        
        if withHarvestLoss {
            forest?.trees.forEach { tree in
                interimTotal += tree.rateValue?.volume ?? 0.0
            }
            rateValue += interimTotal / 100 * Double(forest?.cropLoss ?? 12)
        } else {
            forest?.trees.forEach { tree in
                rateValue += tree.rateValue?.volume ?? 0.0
            }
        }
        
        return rateValue
    }
}
