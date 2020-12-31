//
//  Checkpoint.swift
//  TreasureHuntApp
//
//  Created by Vy on 27.12.20.
//

import Foundation
import MapKit

//TODO: Change class to struct
class Checkpoint:Identifiable {
    
    let id: UUID = UUID()
    var name: String
    //var location: Location
    var coordinate: CLLocationCoordinate2D
    var checked: Bool
    
    // Später mit Datenbank ersetzen, erstmal als Variable:
//    static var checkpoints = [Checkpoint(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 52.39949, longitude: 8.006106)),
//        Checkpoint(name: "Kreuzung", coordinate: CLLocationCoordinate2D(latitude: 52.398325, longitude: 8.001591)),
//        Checkpoint(name: "Kanal", coordinate: CLLocationCoordinate2D(latitude:52.399924, longitude:8.003733))]
    
    init(name:String, coordinate:CLLocationCoordinate2D, checked:Bool = false) {
        self.name = name
        self.coordinate = coordinate
        self.checked = checked
    }
    
    //TODO: Remove static function
    static func getCheckpoints() -> [Checkpoint] {
        var checkpoints = [Checkpoint]()

        checkpoints.append(Checkpoint(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 52.39949, longitude: 8.006106), checked: true))
        checkpoints.append(Checkpoint(name: "Kreuzung", coordinate: CLLocationCoordinate2D(latitude: 52.398325, longitude: 8.001591)))
        checkpoints.append(Checkpoint(name: "Kanal", coordinate: CLLocationCoordinate2D(latitude:52.399924, longitude:8.003733)))

        return checkpoints
    }
    
}
