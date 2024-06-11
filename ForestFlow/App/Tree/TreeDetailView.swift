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
                Map(position: .constant(MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: tree.latitude, longitude: tree.longitude), latitudinalMeters: 250, longitudinalMeters: 250)))) {
                    Marker("Baum Standort", coordinate: CLLocationCoordinate2D(latitude: tree.latitude, longitude: tree.longitude))
                }
                .frame(width: 330, height: 330)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            
            Section("Bauminformationen") {
                Text(tree.woodType.name)
                Text("Stufe: \(tree.rateValue?.stage ?? 0)")
                Text("Volumen: \(tree.rateValue?.volume.string(decimalPlaces: 2) ?? "0.0")")
            }
            
            Section("Waldbesitzer") {
                Text(tree.forestOwner?.name ?? "Unbekannt")
            }
            
            Section("Bemerkungen") {
                Text(tree.remark?.name ?? "Normal Nutzung")
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}


