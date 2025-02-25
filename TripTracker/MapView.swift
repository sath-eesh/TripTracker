//
//  MapView.swift
//  TripTracker
//
//  Created by Satheesh on 25/02/25.
//

import SwiftUI
import MapKit
import FirebaseDatabase

struct UserLocation: Identifiable {
    var id: String
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var usersLocations: [UserLocation] = []
    private let dbRef = Database.database().reference()

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: usersLocations) { user in
            MapAnnotation(coordinate: user.coordinate) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
            }
        }
        .onAppear {
            fetchUserLocations()
        }
    }

    func fetchUserLocations() {
        dbRef.child("users_locations").observe(.value) { snapshot in
            var updatedLocations: [UserLocation] = []
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let data = childSnapshot.value as? [String: Any],
                   let latitude = data["latitude"] as? Double,
                   let longitude = data["longitude"] as? Double {
                    
                    let userLocation = UserLocation(
                        id: childSnapshot.key,
                        coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    )
                    
                    updatedLocations.append(userLocation)
                }
            }

            // Update the state with new locations
            usersLocations = updatedLocations
        }
    }
}
