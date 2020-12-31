//
//  CreateTreasureHuntComponent.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import Foundation

class TreasureHuntComponent {
    
    func createTreasureHunt(name:String, description:String, checkpoints:Array<Checkpoint>) -> TreasureHunt {
        return TreasureHunt(name, description, checkpoints, false, false)
    }
    
    func deleteTreasureHunt() -> Void {
        
    }
    
}
