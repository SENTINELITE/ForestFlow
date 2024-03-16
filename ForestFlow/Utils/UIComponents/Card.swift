//
//  Card.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI

struct Card: View {
    @Environment(\.colorScheme) var colorScheme
    private let cardSize: CGFloat = (UIScreen.main.bounds.width - 60.0) / 2.0
    var name: String
    var systemImage: String
    
    var body: some View {
        ZStack {
            Image(systemName: systemImage)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.componentColorForeground)
                .font(.Bold.large)
                .position(x: 35, y: 30)

            Text(name)
                .font(.Bold.title4)
                .foregroundStyle(colorScheme == .dark ? .white : .accentColor)
        }
        .frame(width: cardSize, height: cardSize)
        .background(.componentColorBackground)
        .clipShape(.rect(cornerRadius: 25.0))
        .shadow(radius: 5)
    }
}

