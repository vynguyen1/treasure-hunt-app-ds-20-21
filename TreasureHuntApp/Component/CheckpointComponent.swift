//
//  CreateTreasureHuntComponent.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import Foundation
import MapKit

class CheckpointComponent {
    
    func createCheckpoint(name:String, latitude:Double, longitude:Double) -> Checkpoint {
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return Checkpoint(name: name, coordinate: coordinate)
    }
    
    func editCheckpoint(checkpoint:Checkpoint, newName:String = "", newCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D()) -> Void {
        let index = findCheckpoint(checkpoint: checkpoint)
        if index != nil {
            if !newName.isEmpty {
                checkpoint.name = newName
            }
            if !newCoordinate.latitude.isNaN && !newCoordinate.longitude.isNaN {
                checkpoint.coordinate = newCoordinate
            }
            TreasureHunt.getTreasureHunts().first!.checkpoints[index!] = checkpoint
        }
    }
    
    func deleteCheckpoint(checkpoint:Checkpoint) -> Void {
        let index = findCheckpoint(checkpoint: checkpoint)
        if index != nil {
            TreasureHunt.getTreasureHunts().first!.checkpoints.remove(at: index!)
        }
    }
    
    private func findCheckpoint(checkpoint:Checkpoint) -> Int? {
        let index = TreasureHunt.getTreasureHunts().first!.checkpoints.firstIndex{$0.id == checkpoint.id}
        return index
    }
    
}
