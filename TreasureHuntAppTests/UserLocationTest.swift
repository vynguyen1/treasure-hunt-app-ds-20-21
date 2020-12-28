//
//  UserLocationTest.swift
//  TreasureHuntAppTests
//
//  Created by Vy on 28.12.20.
//

import XCTest
import CoreLocation
@testable import TreasureHuntApp

class UserLocationTest: XCTestCase {
  
  func test_user_location_updates() {
    let locations: [CLLocation] = [CLLocation(latitude: 12, longitude: 10)]
    
    let userLocation = UserLocation()
    
    userLocation.locationManager(CLLocationManager(), didUpdateLocations: locations)
    
    XCTAssertEqual(12, userLocation.userLatitude)
    XCTAssertEqual(10, userLocation.userLongitude)
  }
}
