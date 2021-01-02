//
//  TreasureHunt.swift
//  TreasureHuntApp
//
//  Created by Vy on 27.12.20.
//

import Foundation
import MapKit

//TODO: Change class to struct
class TreasureHunt: Identifiable,ObservableObject {
    
    let id = UUID()
    @Published var name: String
    @Published var description: String
    @Published var checkpoints: Array<Checkpoint>
    @Published var finished: Bool
    @Published var inProgress: Bool

    init(_ name:String, _ description:String, _ checkpoints:Array<Checkpoint>, _ finished:Bool, _ inProgress:Bool) {
        self.name = name
        self.description = description
        self.checkpoints = checkpoints
        self.finished = finished
        self.inProgress = inProgress
    }
    
    //TODO: Remove static function
    // Später mit Datenbank ersetzen, erstmal als static Variable:
//    static func getTreasureHunts() -> [TreasureHunt] {
//        var treasureHunts = [TreasureHunt]()
//
//        treasureHunts.append(TreasureHunt("Test Schnitzeljagd", "Dies ist ein erster Test Hunt aus dem bescheidenen Örtchen Bramsche :-)\nshdjkfjkjg gjwiotrhwpitnsg snrthipn", Checkpoint.getCheckpoints(), false, false))
//        treasureHunts.append(TreasureHunt("Test 2", "asdfghjkl. Dies ist ein zweiter Test Hunt. Beschreibung folgt.", [Checkpoint(name: "Test", hint: "Test hint", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))], false, true))
//        treasureHunts.append(TreasureHunt("Test 3", "Lorem Ipsum", [], true, false))
//        treasureHunts.append(TreasureHunt("Test 4", "", [], true, false))
//
//        return treasureHunts
//    }
}
