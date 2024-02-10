//
//  RateTypeAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 13.01.2024.
//

import SwiftUI
import SwiftData

struct RateTypesView: View {
    @Query var rateTypes: [RateType]
    @Environment(\.modelContext) var context
    
    
    var body: some View {
        List {
            ForEach(rateTypes, id: \.self) { rateType in
                NavigationLink {
                    RateTypeModifyView(rateType: rateType)
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
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(destination: RateValueAddView()) {
                    PlusButton()
                }
            }
        }
    }
}

#Preview {
    RateTypesView()
}
