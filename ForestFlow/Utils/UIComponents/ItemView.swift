//
//  ListItem.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 03.07.23.
//

import SwiftUI

struct ItemView: View {
    
    let itemName: String
    
    init(itemName: String) {
        self.itemName = itemName
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(itemName)
                .font(.headline)
                .fontWeight(.semibold)
            
            HStack {
                Text("187 Stk.")
                Spacer()
                Text("220m3")
            }
        }
    }
}

#Preview {
    ItemView(itemName: "Example")
}
