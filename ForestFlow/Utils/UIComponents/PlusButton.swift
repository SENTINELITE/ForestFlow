//
//  PlusButton.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 04.01.2024.
//

import SwiftUI

struct PlusButton: View {
    var body: some View {
        Image(systemName: "plus.circle.fill")
            .font(.Regular.extraLarge)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.componentColorForeground, .componentColorBackground)
            .shadow(radius: 10)
            .offset(CGSize(width: -10.0, height: -35.0))
          
    }
}

#Preview {
    PlusButton()
}
