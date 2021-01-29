//
//  Checkpoint.swift
//  TreasureHuntApp
//
//  Created by Vy on 27.12.20.
//

import Foundation
import MapKit

// TODO: Change class to struct?
class Checkpoint: Identifiable {
    
    let id: UUID = UUID()
    var name: String
    // var location: Location
    var hint: String
    var coordinate: CLLocationCoordinate2D
    var checked: Bool
    
    init(name: String, hint: String, coordinate: CLLocationCoordinate2D, checked: Bool = false) {
        self.name = name
        self.hint = hint
        self.coordinate = coordinate
        self.checked = checked
    }
    
    // TODO: Remove static function
//    static func getCheckpoints() -> [Checkpoint] {
//        var checkpoints = [Checkpoint]()
//
//        checkpoints.append(Checkpoint(name: "Home", hint: "Hier wohnst du.", coordinate: CLLocationCoordinate2D(latitude: 52.39949, longitude: 8.006106), checked: true))
//        checkpoints.append(Checkpoint(name: "Kreuzung", hint: "Hier steht ein Briefkasten", coordinate: CLLocationCoordinate2D(latitude: 52.398325, longitude: 8.001591)))
//        checkpoints.append(Checkpoint(name: "Kanal", hint: "Hier gibt's viel Wasser!", coordinate: CLLocationCoordinate2D(latitude:52.399924, longitude:8.003733)))
//
//        return checkpoints
//    }
}
