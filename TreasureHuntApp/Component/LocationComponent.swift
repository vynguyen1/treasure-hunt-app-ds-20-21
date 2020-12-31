//
//  LocationComponent.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import Foundation
import MapKit

class LocationComponent {
    
    private static let errorThreshold: Double = 0.0002

    static func getCurrentLocation() -> CLLocationCoordinate2D {
        let userLocation = UserLocation()
        return CLLocationCoordinate2D(latitude: userLocation.userLatitude, longitude: userLocation.userLongitude)
    }

    static func checkpointHasBeenReached() -> Bool {
        let userLocation = getCurrentLocation()
        let checkpointLocation = getLocationOfCurrentCheckpoint()
        return (abs(userLocation.latitude - checkpointLocation.latitude) <= errorThreshold) && (abs(userLocation.longitude - checkpointLocation.longitude) <= errorThreshold)
    }

    static func getLocationOfCurrentCheckpoint() -> CLLocationCoordinate2D {
        let currentCheckpoint = getCurrentCheckpoint()
        if currentCheckpoint != nil {
            return currentCheckpoint!.coordinate
        } else {
            return CLLocationCoordinate2D()
        }
    }
    
    static func getCurrentCheckpoint() -> Checkpoint? {
        return Checkpoint.getCheckpoints().filter { checkpoint in
            return checkpoint.checked == false
        }.first
    }
}

