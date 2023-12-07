//
//  MapView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.06.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var showMapPopOver = false
    var body: some View {
        NavigationView {
            Map()
                .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    MapView()
}
