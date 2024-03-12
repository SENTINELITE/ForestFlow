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
    
    @State private var showModifyView = false
    
    var body: some View {
        List {
            ForEach(rateTypes, id: \.self) { rateType in
                NavigationLink(value: rateType) {
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
        .navigationDestination(for: RateType.self) { rateType in
            RateTypeModifyView(rateType: .constant(rateType), rateValues: rateType.rateValues, name: rateType.name, isEditing: true)
        }
        .navigationDestination(for: Bool.self) { _ in
            RateTypeModifyView(rateType: .constant(nil), rateValues: [], name: "", isEditing: false)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(value: true) {
                    PlusButton()
                }
            }
        }
    }
}


