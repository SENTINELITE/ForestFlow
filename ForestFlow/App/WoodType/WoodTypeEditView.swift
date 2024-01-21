//
//  WoodTypeEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI

struct WoodTypeEditView: View {
    @Bindable var woodType: WoodType
    
    var body: some View {
        Form {
            TextField("Name", text: $woodType.name)
        }
    }
}

