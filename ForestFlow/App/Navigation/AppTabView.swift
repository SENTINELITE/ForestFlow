//
//  AppTabView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI

struct AppTabView: View {
    @State var selection: AppScreen = .forest

    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases, id: \.self) { screen in
                screen.destination
                    .tabItem { screen.label }
            }
        }
    }
}
