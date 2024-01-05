//
//  AppTabView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI

struct AppTabView: View {
    @Binding var selection: AppScreen?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases, id: \.self) { screen in
                NavigationStack {
                    screen.destination
                        .tag(screen as AppScreen?)
                        .tabItem { screen.label }
                }
            }
        }
    }
}

#Preview {
    AppTabView(selection: .constant(.forest))
}
