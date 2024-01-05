//
//  Card.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI

struct Card: View {
    private let cardSize = (UIScreen.main.bounds.width - 60) / 2
    var name: String
    var systemImage: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(width: cardSize)
            
            VStack {
                Image(systemName: systemImage)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.accentColor)
            }
            Text(name)
        }
    }
}

