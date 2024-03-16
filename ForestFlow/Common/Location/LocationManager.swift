//
//  LocationManager.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 03.01.24.
//

import Foundation
import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {

    // MARK: - Properties
    private let manager: CLLocationManager = .init()
    var location: CLLocationCoordinate2D?

    // MARK: - Initializer
    override init() {
        super.init()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
    }

    // MARK: - Location Request
    func request() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error requesting Location: \(error.localizedDescription)")
    }
}
