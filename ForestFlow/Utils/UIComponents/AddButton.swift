//
//  AddButton.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 13.01.2024.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        HStack {
            Image(systemName: "plus.circle.fill")
                .foregroundStyle(.green)
                .font(.Regular.title)
            Text("Stufe hinzufügen")
        }
    }
}

#Preview {
    AddButton()
}
