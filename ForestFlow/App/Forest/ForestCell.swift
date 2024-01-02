//
//  ForestCell.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI

struct ForestCell: View {
    let forest: Forest

    var body: some View {
        HStack {
            Text(forest.name)
                .font(.Bold.title3)

            Spacer()

            VStack(spacing: 10.0) {
                Text("123 Bäume")
                    .font(.Regular.small)
                    .foregroundStyle(.gray)

                Text("200 m3")
                    .font(.Regular.small)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 10.0)
        }
        .padding(10.0)
    }
}
