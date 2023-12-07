//
//  ForestOwnerItem.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 12.07.23.
//

import SwiftUI

struct ForestOwnerView: View {
    @State var forestOwner: [String] = []
    @State private var query = ""
    
    var body: some View {
        VStack {
            ForEach($forestOwner, id: \.self) { $forestOwner in
                TextField("Waldbesitzer", text: $forestOwner)
                    .padding(.leading)
                 
            }
            Button(action: {
                forestOwner.append("")
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Waldbesitzer hinzufügen")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading)
            }
        }
    }
}

#Preview {
    ForestOwnerView()
}
