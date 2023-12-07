//
//  InfoListView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 18.06.23.
//

import SwiftUI

struct ListDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Stk. Nummer")
                    Text("Volumen")
                }
            }.toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                     Image(systemName: "xmark.circle.fill")
                    }
                }
                ToolbarItemGroup(placement: .principal) {
                    Text("Test")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    ListDetailView()
}
