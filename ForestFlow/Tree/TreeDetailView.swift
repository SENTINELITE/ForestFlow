//
//  TreeDetailView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 18.06.23.
//

import SwiftUI
import MapKit

struct TreeDetailView: View {
    @State private var textFieldText = ""
    @State private var text = "Test"
    var body: some View {
        Form {
            Section {
                Image(systemName: "tree.circle.fill")
                    .font(.system(size: 80))
                    .shadow(radius: 5)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                TextField(
                    "Baumart",
                    text: $textFieldText,
                    prompt: Text(text).foregroundColor(.brown)
                )
                .font(.title)
                .fontWeight(.bold)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(5)
                .multilineTextAlignment(TextAlignment.center)
            }
            .listRowSeparator(.hidden)
            
            Section {
                Text("Nummer")
            }
            
            Section {
                Map()
                    .frame(width: 350, height: 350)
                    .cornerRadius(15)
            }.listRowBackground(Color.clear)
            
            Section {
                Text("Holzart")
                Text("Stufe")
            }
        }
    }
}

#Preview {
    NavigationView {
        TreeDetailView()
    }
}
