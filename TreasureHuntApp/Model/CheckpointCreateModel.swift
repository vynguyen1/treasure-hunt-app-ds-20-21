//
//  CheckpointCreateModel.swift
//  TreasureHuntApp
//
//  Created by Vy on 10.02.21.
//

import CoreData
import Foundation
import MapKit

class CheckpointCreateModel: Identifiable {
    
    var uuid: UUID
    var name: String
    var hint: String
    var locationLatitude: Double
    var locationLongitude: Double
    var checked: Bool
    
    init(uuid: UUID, name: String, hint: String, locationLatitude: Double, locationLongitude: Double, checked: Bool = false) {
        self.uuid = uuid
        self.name = name
        self.hint = hint
        self.locationLatitude = locationLatitude
        self.locationLongitude = locationLongitude
        self.checked = checked
    }
    
    static func createModelsToCheckpoints(_ createModels: [CheckpointCreateModel], _ viewContext: NSManagedObjectContext) -> [Checkpoint] {
        var checkpoints: [Checkpoint] = []
        for createModel in createModels {
            checkpoints.append(createModelToCheckpoint(createModel, viewContext))
        }
        return checkpoints
    }
    
    static func createModelToCheckpoint(_ checkpointCreateModel: CheckpointCreateModel, _ viewContext: NSManagedObjectContext) -> Checkpoint {
        let checkpointDescription = NSEntityDescription.entity(forEntityName: "Checkpoint", in: viewContext)
        let checkpoint = Checkpoint(entity: checkpointDescription!, insertInto: viewContext)
        checkpoint.uuid = checkpointCreateModel.uuid
        checkpoint.name = checkpointCreateModel.name
        checkpoint.checked = checkpointCreateModel.checked
        checkpoint.hint = checkpointCreateModel.hint
        checkpoint.locationLatitude = checkpointCreateModel.locationLatitude
        checkpoint.locationLongitude = checkpointCreateModel.locationLongitude
        return checkpoint
    }
    
    static func checkpointsToCreateModels(_ checkpoints: [Checkpoint]) -> [CheckpointCreateModel] {
        var checkpointCreateModels: [CheckpointCreateModel] = []
        for checkpoint in checkpoints {
            checkpointCreateModels.append(checkpointToCreateModel(checkpoint))
        }
        return checkpointCreateModels
    }
    
    static func checkpointToCreateModel(_ checkpoint: Checkpoint) -> CheckpointCreateModel {
        let uuid = checkpoint.uuid
        let name = checkpoint.name
        let checked = checkpoint.checked
        let hint = checkpoint.hint
        let locationLatitude = checkpoint.locationLatitude
        let locationLongitude = checkpoint.locationLongitude
        return CheckpointCreateModel(uuid: uuid,
                                     name: name,
                                     hint: hint,
                                     locationLatitude: locationLatitude,
                                     locationLongitude: locationLongitude,
                                     checked: checked)
    }
}
