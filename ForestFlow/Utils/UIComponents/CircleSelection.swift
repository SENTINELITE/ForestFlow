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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 15) {
            ForEach(items, id: \.self) { item in
                Circle()
                    .foregroundColor(.accentColor)
                    .opacity(0.7)
                    .frame(width: 55, height: 55)
                    .overlay(
                        Text(item.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                    )
                    .overlay(
                        Circle()
                            .stroke(selected?.name == item.name ? Color.brown : Color.clear, lineWidth: 3)
                            .padding(-5)
                    )
                    .onTapGesture {
                        selected = item
                    }
            }
        }
    }
}
