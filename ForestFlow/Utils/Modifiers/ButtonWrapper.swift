//
//  ButtonWrapper.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI

struct ButtonWrapper: ViewModifier {

    var action: () -> Void

    func body(content: Content) -> some View {
        Button { action() } label: { content }
    }
}
