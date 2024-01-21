//
//  RateTypeAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 13.01.2024.
//

import SwiftUI
import SwiftData

struct RateTypeAddView: View {
    @Query var rateTypes: [RateType]
    @Environment(\.modelContext) var context
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(rateTypes, id: \.self) { rateType in
                    NavigationLink {
                        RateValueEditView(rateType: rateType)
                    } label: {
                        Text(rateType.name)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            context.delete(rateType)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Tarife")
            .toolbar(.hidden, for: .tabBar)
            .overlay(alignment: .bottomTrailing) {
                NavigationLink(destination: RateValueAddView()) {
                    PlusButton()
                }
            }
        }
    }
}

#Preview {
    RateTypeAddView()
}
