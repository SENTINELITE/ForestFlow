//
//  ForestOwnerEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI

struct ForestOwnerEditView: View {
    @Bindable var forestOwner: ForestOwner
    
    var body: some View {
        Form {
            TextField("Name", text: $forestOwner.name)
        }
    }
}


