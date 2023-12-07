//
//  SettingsItem.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 28.07.23.
//

import SwiftUI

struct SettingsItemView: View {
    
    let name: String
    let systemImage: String
    
    init(name: String, systemImage: String) {
        self.name = name
        self.systemImage = systemImage
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(.brown)
                .cornerRadius(8)
                .overlay(
                    Image(systemName: systemImage)
                        .foregroundColor(.white)
                        .font(.subheadline)
                )
            Text(name)
        }
    }
}

#Preview {
    SettingsItemView(name: "Example", systemImage: "moon.fill")
}
