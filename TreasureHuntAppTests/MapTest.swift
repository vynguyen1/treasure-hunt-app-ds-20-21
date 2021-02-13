//
//  MapTest.swift
//  TreasureHuntAppTests
//
//  Created by Vy on 11.02.21.
//

import XCTest
import CoreData
@testable import TreasureHuntApp

class MapTest: XCTestCase {
    
    private let viewContext = PersistenceController.preview.container.viewContext

    func test_get_current_checkpoint() {

    }
    
    func test_get_location_of_current_checkpoint() {
        
    }
    
    func test_if_checkpoint_has_been_reached() {
        
    }
    
    func test_is_finished() {
        
    }
    
    func test_update_checkpoint() {
        
    }
    
    private func createTreasureHunt() -> TreasureHunt {
        let treasureHuntDescription = NSEntityDescription.entity(forEntityName: "TreasureHunt", in: viewContext)
        let treasureHunt = TreasureHunt(entity: treasureHuntDescription!, insertInto: viewContext)
        treasureHunt.name = "Treasure Hunt"
        treasureHunt.uuid = UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!
        treasureHunt.inProgress = false
        treasureHunt.finished = false
        treasureHunt.huntDescription = "Description of the Treasure Hunt"
        
        let checkpointDescription = NSEntityDescription.entity(forEntityName: "Checkpoint", in: viewContext)
        let checkpoint = Checkpoint(entity: checkpointDescription!, insertInto: viewContext)
        checkpoint.uuid = UUID(uuidString: "960bfe9c-42dc-4652-ba98-7364f0a4f568")!
        checkpoint.name = "Checkpoint #1"
        checkpoint.checked = false
        checkpoint.hint = "This is a hint."
        checkpoint.locationLatitude = 52.545175
        checkpoint.locationLongitude = 13.3494393
        checkpoint.rank = 0
        checkpoint.treasureHunt = treasureHunt
        
        let checkpoint2 = Checkpoint(entity: checkpointDescription!, insertInto: viewContext)
        checkpoint2.uuid = UUID(uuidString: "53e481f0-70d2-476e-8a12-d9d38e2f4982")!
        checkpoint2.name = "Checkpoint #2"
        checkpoint2.checked = false
        checkpoint2.hint = "This is another hint."
        checkpoint2.locationLatitude = 52.5274805
        checkpoint2.locationLongitude = 13.342754
        checkpoint.rank = 1
        checkpoint2.treasureHunt = treasureHunt
        
        return treasureHunt
    }

}
