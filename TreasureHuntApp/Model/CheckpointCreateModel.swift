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
    
    let uuid: UUID
    let name: String
    let hint: String
    let locationLatitude: Double
    let locationLongitude: Double
    let checked: Bool
    var rank: Int
    
    init(uuid: UUID, name: String, hint: String, locationLatitude: Double, locationLongitude: Double, checked: Bool = false, rank: Int) {
        self.uuid = uuid
        self.name = name
        self.hint = hint
        self.locationLatitude = locationLatitude
        self.locationLongitude = locationLongitude
        self.checked = checked
        self.rank = rank
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
        checkpoint.rank = checkpointCreateModel.rank
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
        let rank = checkpoint.rank
        return CheckpointCreateModel(uuid: uuid,
                                     name: name,
                                     hint: hint,
                                     locationLatitude: locationLatitude,
                                     locationLongitude: locationLongitude,
                                     checked: checked,
                                     rank: rank)
    }
}

extension CheckpointCreateModel: Equatable {
    static func == (model1: CheckpointCreateModel, model2: CheckpointCreateModel) -> Bool {
            return
                model1.uuid == model2.uuid &&
                model1.name == model2.name &&
                model1.hint == model2.hint &&
                model1.locationLatitude == model2.locationLatitude &&
                model1.locationLongitude == model2.locationLongitude &&
                model1.checked == model2.checked &&
                model1.rank == model2.rank
        }
}
