//
//  TreasureHunts.swift
//  TreasureHuntApp
//
//  Created by Vy on 02.01.21.
//

import Foundation
import MapKit

class TreasureHunts:ObservableObject {
    
    @Published var treasureHunts:[TreasureHunt] = [
        TreasureHunt(name: "Test Schnitzeljagd",
                     description: "Dies ist ein erster Test Hunt aus dem bescheidenen Örtchen Bramsche :-)\nshdjkfjkjg gjwiotrhwpitnsg snrthipn",
                     checkpoints: [Checkpoint(name: "Home", hint: "Hier wohnst du.", coordinate: CLLocationCoordinate2D(latitude: 52.39949, longitude: 8.006106), checked: true),
                    Checkpoint(name: "Kreuzung", hint: "Hier steht ein Briefkasten", coordinate: CLLocationCoordinate2D(latitude: 52.398325, longitude: 8.001591)),
                    Checkpoint(name: "Kanal", hint: "Hier gibt's viel Wasser!", coordinate: CLLocationCoordinate2D(latitude:52.399924, longitude:8.003733))]),
        TreasureHunt(name: "Test 2", description: "asdfghjkl. Dies ist ein zweiter Test Hunt. Beschreibung folgt.", checkpoints: [Checkpoint(name: "Test", hint: "Test hint", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))], finished: false, inProgress: true),
        TreasureHunt(name: "Test 3", description: "Lorem Ipsum", checkpoints: [], finished: true, inProgress: false),
        TreasureHunt(name: "Test 4", description: "", checkpoints: [Checkpoint(name: "Home", hint: "Hier wohnst du.", coordinate: CLLocationCoordinate2D(latitude: 52.39949, longitude: 8.006106), checked: false)])]
    
}
