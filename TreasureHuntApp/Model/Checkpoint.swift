//
//  Checkpoint.swift
//  TreasureHuntApp
//
//  Created by Vy on 27.12.20.
//

import Foundation
import MapKit

class Checkpoint: Identifiable {
    
    let uuid: UUID = UUID()
    var name: String
    var hint: String
    var coordinate: CLLocationCoordinate2D
    var checked: Bool
    
    init(name: String, hint: String, coordinate: CLLocationCoordinate2D, checked: Bool = false) {
        self.name = name
        self.hint = hint
        self.coordinate = coordinate
        self.checked = checked
    }
}
