//
//  CheckpointCreateModelTest.swift
//  TreasureHuntAppTests
//
//  Created by Vy on 11.02.21.
//

import XCTest
import CoreData
@testable import TreasureHuntApp

class CheckpointCreateModelTest: XCTestCase {
    
    private let viewContext = PersistenceController.preview.container.viewContext
    private let uuid = UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")
    private let checkpointName = "#1 Checkpoint"
    private let hint = "This is a hint."
    private let locationLatitude = 52.545175
    private let locationLongitude = 13.3494393
    private let checked = false
    private let rank = 0

    func test_checkpoint_to_create_model() {
        
        let createModelControl = createCheckpointModel()
        let checkpoint = createCheckpoint()
        
        let createModelToTest = CheckpointCreateModel.checkpointToCreateModel(checkpoint)
        
        XCTAssertEqual(createModelControl, createModelToTest)
    }
    
    func test_create_model_to_checkpoint() {
        
        let checkpointControl = createCheckpoint()
        let createModel = createCheckpointModel()
        
        let checkpointToTest = CheckpointCreateModel.createModelToCheckpoint(createModel, viewContext)
        
        XCTAssertEqual(checkpointControl.uuid, checkpointToTest.uuid)
        XCTAssertEqual(checkpointControl.name, checkpointToTest.name)
        XCTAssertEqual(checkpointControl.hint, checkpointToTest.hint)
        XCTAssertEqual(checkpointControl.locationLatitude, checkpointToTest.locationLatitude)
        XCTAssertEqual(checkpointControl.locationLongitude, checkpointToTest.locationLongitude)
        XCTAssertEqual(checkpointControl.checked, checkpointToTest.checked)
    }
    
    private func createCheckpointModel() -> CheckpointCreateModel {
        return CheckpointCreateModel(uuid: self.uuid!,
                                     name: self.checkpointName,
                                     hint: self.hint,
                                     locationLatitude: self.locationLatitude,
                                     locationLongitude: self.locationLongitude,
                                     checked: self.checked,
                                     rank: self.rank)
    }
    
    private func createCheckpoint() -> Checkpoint {
        let checkpointDescription = NSEntityDescription.entity(forEntityName: "Checkpoint", in: viewContext)
        let checkpoint = Checkpoint(entity: checkpointDescription!, insertInto: viewContext)
        checkpoint.uuid = self.uuid!
        checkpoint.name = self.checkpointName
        checkpoint.hint = self.hint
        checkpoint.locationLatitude = self.locationLatitude
        checkpoint.locationLongitude = self.locationLongitude
        checkpoint.checked = self.checked
        return checkpoint
    }

}
