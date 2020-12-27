//
//  TreasureHunt.swift
//  TreasureHuntApp
//
//  Created by Vy on 27.12.20.
//

import Foundation

class TreasureHunt {
    
    var name: String //{
        //willSet()
    //}
    var description: String
    var checkpoints: Array<Checkpoint>
    var finished: Bool
    var started: Bool

    init(_ name:String, _ description:String, _ checkpoints:Array<Checkpoint>, _ finished:Bool, _ started:Bool) {
        self.name = name
        self.description = description
        self.checkpoints = checkpoints
        self.finished = finished
        self.started = started
    }    
}
