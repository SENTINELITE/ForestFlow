//
//  TreeDetailView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 21.01.2024.
//

import SwiftUI
import MapKit

struct TreeDetailView: View {
    @Bindable var tree: Tree
    
    var body: some View {
        Form {
            Section("Standort") {
                Map(position: .constant(MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: tree.latitude, longitude: tree.longitude), latitudinalMeters: 500, longitudinalMeters: 500)))) {
                    Marker("Baum Standort", coordinate: CLLocationCoordinate2D(latitude: tree.latitude, longitude: tree.longitude))
                }
                .frame(width: 300, height: 300)
            }
            
            Section("Bauminformationen") {
                Text(tree.woodType.name)
                Text("Stufe: \(tree.rateValue?.stage ?? 0)")
                Text("Volumen: \(tree.rateValue?.volume.string(decimalPlaces: 2) ?? "0.0")")
            }
            
            Section("Waldbesitzer") {
                Text(tree.forestOwner.name)
            }
            
            Section("Bemerkungen") {
                Text(tree.remark.name)
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}


