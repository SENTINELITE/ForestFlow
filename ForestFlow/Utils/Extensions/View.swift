//
//  View.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI

extension View {

    func button(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }

    #if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
    #endif
}
