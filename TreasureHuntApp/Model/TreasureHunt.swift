//
//  TreasureHunt.swift
//  TreasureHuntApp
//
//  Created by Vy on 27.12.20.
//

import Foundation

//TODO: Change class to struct
class TreasureHunt:Identifiable {
    
    var id = UUID()
    var name: String
    var description: String
    var checkpoints: Array<Checkpoint>
    var finished: Bool
    var inProgress: Bool

    init(_ name:String, _ description:String, _ checkpoints:Array<Checkpoint>, _ finished:Bool, _ inProgress:Bool) {
        self.name = name
        self.description = description
        self.checkpoints = checkpoints
        self.finished = finished
        self.inProgress = inProgress
    }
    
    //TODO: Remove static function
    // Später mit Datenbank ersetzen, erstmal als static Variable:
    static func getTreasureHunts() -> [TreasureHunt] {
        var treasureHunts = [TreasureHunt]()
        
        treasureHunts.append(TreasureHunt("Test Schnitzeljagd", "Dies ist ein erster Test Hunt aus dem bescheidenen Örtchen Bramsche :-)", Checkpoint.getCheckpoints(), false, false))
        treasureHunts.append(TreasureHunt("Test 2", "asdfghjkl", [], false, true))
        treasureHunts.append(TreasureHunt("Test 3", "Lorem Ipsum", [], true, false))
        treasureHunts.append(TreasureHunt("Test 4", "", [], true, false))
        
        return treasureHunts
    }
}
