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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(rateTypes, id: \.self) { rateType in
                    Text(rateType.name)
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
