//
//  LocationComponent.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import Foundation
import MapKit

class LocationComponent {
    
    private let errorThreshold: Double = 0.0001

    func getCurrentLocation() -> CLLocationCoordinate2D {
        let userLocation = UserLocation()
        return CLLocationCoordinate2D(latitude: userLocation.userLatitude, longitude: userLocation.userLongitude)
    }

    func checkIfCheckpointHasBeenReached() -> Bool {
        let userLocation = getCurrentLocation()
        let checkpointLocation = getCurrentCheckpointLocation()
        return (abs(userLocation.latitude - checkpointLocation.latitude) <= errorThreshold) && (abs(userLocation.longitude - checkpointLocation.longitude) <= errorThreshold)
    }

    func getCurrentCheckpointLocation() -> CLLocationCoordinate2D {
        let currentCheckpoint = Checkpoint.getCheckpoints().filter { checkpoint in
            return checkpoint.checked == false
        }.first
        if currentCheckpoint != nil {
            return currentCheckpoint!.coordinate
        } else {
            return CLLocationCoordinate2D()
        }
    }
}

