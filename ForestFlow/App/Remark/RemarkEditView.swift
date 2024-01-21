//
//  RemarkEditView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 16.01.2024.
//

import SwiftUI

struct RemarkEditView: View {
    @Bindable var remark: Remark
    
    var body: some View {
        Form {
            TextField("Name", text: $remark.name)
        }
    }
}

