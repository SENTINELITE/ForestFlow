//
//  CircleSelection.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 05.01.24.
//

import SwiftUI

struct CircleSelection<S: Selectable>: View {

    let items: [S]
    @Binding var selected: S?

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))], alignment: .leading, spacing: 15) {
            ForEach(items, id: \.id) { item in
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10.0)
                    .frame(height: 55)
                    .frame(minWidth: 55, maxWidth: 75)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(selected?.id == item.id ? .accentColor: .accentColor.opacity(0.2))
                            .opacity(0.7)
                    )
                    .onTapGesture {
                        selected = item
                    }
            }
        }
    }
}
