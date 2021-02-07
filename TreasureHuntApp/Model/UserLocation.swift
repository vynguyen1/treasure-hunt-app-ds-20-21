//
//  Location.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import Foundation
import Combine
import CoreLocation

class UserLocation: NSObject, ObservableObject {
    
    @Published var userLatitude: Double = 52.520008
    @Published var userLongitude: Double = 13.404954
    
    private let locationManager = CLLocationManager()
      
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension UserLocation: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    userLatitude = location.coordinate.latitude
    userLongitude = location.coordinate.longitude
    print(location)
  }
}
