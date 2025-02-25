//
//  FirestoreManager.swift
//  TripTracker
//
//  Created by Satheesh on 25/02/25.
//

import Firebase
import FirebaseFirestore
import CoreLocation

class FirestoreManager: ObservableObject {
    private let db = Firestore.firestore()
    
    func updateUserLocation(userId: String, location: CLLocationCoordinate2D) {
        let data: [String: Any] = [
            "latitude": location.latitude,
            "longitude": location.longitude,
            "timestamp": Timestamp()
        ]
        db.collection("locations").document(userId).setData(data, merge: true)
    }
    
    func fetchAllLocations(completion: @escaping ([String: CLLocationCoordinate2D]) -> Void) {
        db.collection("locations").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            var locations: [String: CLLocationCoordinate2D] = [:]

            for doc in documents {
                if let lat = doc.data()["latitude"] as? Double,
                   let lon = doc.data()["longitude"] as? Double {
                    locations[doc.documentID] = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                }
            }
            completion(locations)
        }
    }
}
