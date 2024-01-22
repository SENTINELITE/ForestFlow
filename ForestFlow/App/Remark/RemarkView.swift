//
//  RemarkAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct RemarkView: View {

    @Environment(\.modelContext) var context
    
    // MARK: - Query
    @Query var remarks: [Remark]

    var body: some View {
        List(remarks, id: \.self) { remark in
            NavigationLink(value: remark) {
                Text(remark.name)
            }
            .swipeActions {
                Button(role: .destructive) {
                    context.delete(remark)
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .navigationTitle("Bemerkungen")
        .toolbar(.hidden, for: .tabBar)
        .overlay(alignment: .bottomTrailing) {
            NavigationLink(value: "NewRemark") {
                PlusButton()
            }
        }
    }
}


