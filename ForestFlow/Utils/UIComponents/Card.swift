//
//  Card.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI

struct Card: View {
    private let cardSize: CGFloat = (UIScreen.main.bounds.width - 60.0) / 2.0
    var name: String
    var systemImage: String
    
    var body: some View {
        ZStack {
            Image(systemName: systemImage)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color.accentColor)
                .font(.Bold.large)
                .position(x: 35, y: 30)

            Text(name)
                .font(.Bold.title4)
        }
        .frame(width: cardSize, height: cardSize)
        .background(.white)
        .clipShape(.rect(cornerRadius: 25.0))
        .shadow(radius: 5)
    }
}

