//
//  MapView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 25.05.2024.
//

import SwiftUI
import SwiftData
import MapKit

struct MapView: View {
    @Query private var trees: [Tree]
    
    @State private var position: MapCameraPosition = .automatic
    @State private var selectedTree: Tree?
    @State private var isDetailShowing: Bool = false
    
    var body: some View {
        Map(position: $position, selection: $selectedTree) {
            ForEach(trees, id: \.id) { tree in
                Marker(tree.woodType.name, systemImage: "tree.fill", coordinate: CLLocationCoordinate2D(latitude: tree.latitude, longitude: tree.longitude))
                    .tag(tree)
                    .tint(.accent)
            }
        }
        .mapControls {
            MapCompass()
            MapUserLocationButton()
            MapScaleView()
        }
        
        .onChange(of: selectedTree) {
            if selectedTree != nil {
                isDetailShowing.toggle()
            }
        }
        .sheet(isPresented: $isDetailShowing, onDismiss: {
            selectedTree = nil
        }) {
            NavigationStack {
                SelectionDetailView(selectedTree: $selectedTree)
            }
            .presentationDetents([.medium, .large])
            .presentationBackground(.regularMaterial)
        }
    }
}

#Preview {
    MapView()
}
