//
//  LocationManager.swift
//  TripTracker
//
//  Created by Satheesh on 25/02/25.
//

import FirebaseDatabase
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: CLLocationCoordinate2D?
    private var locationManager = CLLocationManager()
    private let dbRef = Database.database().reference()
    private let userID = UIDevice.current.identifierForVendor?.uuidString ?? "unknown_user"

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location.coordinate

        // Update Realtime Database with the new location
        let userLocationData: [String: Any] = [
            "latitude": location.coordinate.latitude,
            "longitude": location.coordinate.longitude,
            "lastUpdated": Int(Date().timeIntervalSince1970) // Unix Timestamp
        ]

        dbRef.child("users_locations").child(userID).setValue(userLocationData)
    }
}
