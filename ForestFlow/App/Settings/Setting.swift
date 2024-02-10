//
//  Setting.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 10.02.2024.
//

import Foundation
import SwiftUI

enum Setting: CaseIterable {
    case rateType
    case remark
    case woodType
    case forestOwner
}

extension Setting {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .rateType:
            Label("Tarife", systemImage: "eurosign.arrow.circlepath")
        case .remark:
            Label("Bemerkungen", systemImage: "text.bubble.fill")
        case .woodType:
            Label("Baumart", systemImage: "tree.fill")
        case .forestOwner:
            Label("Waldbesitzer", systemImage: "person.fill")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .rateType:
            RateTypesView()
        case .remark:
            RemarksView()
        case .woodType:
            WoodTypesView()
        case .forestOwner:
            ForestOwnersView()
        }
    }
}
