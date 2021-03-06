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
        let treasureHunt = createTreasureHunt()
        let userLocation = UserLocation()
        let currentCheckpoint = MapView(treasureHunt: treasureHunt, userLocation: userLocation).getCurrentCheckpoint()
        
        let controlCheckpoint = treasureHunt.checkpoints?.sorted(by: { $0.rank < $1.rank })[1]
        
        XCTAssertTrue(
            controlCheckpoint!.uuid == currentCheckpoint!.uuid &&
            controlCheckpoint!.name == currentCheckpoint!.name &&
            controlCheckpoint!.hint == currentCheckpoint!.hint &&
            controlCheckpoint!.locationLatitude == currentCheckpoint!.locationLatitude &&
            controlCheckpoint!.locationLongitude == currentCheckpoint!.locationLongitude &&
            controlCheckpoint!.checked == currentCheckpoint!.checked &&
            controlCheckpoint!.rank == currentCheckpoint!.rank
        )
    }
    
    func test_get_location_of_current_checkpoint() {
        let treasureHunt = createTreasureHunt()
        let userLocation = UserLocation()
        let locationOfCurrentCheckpoint = MapView(treasureHunt: treasureHunt, userLocation: userLocation).getLocationOfCurrentCheckpoint()
        
        let locationControl = CLLocationCoordinate2D(latitude: 52.5274805, longitude: 13.342754)
        
        XCTAssertTrue(locationControl.latitude == locationOfCurrentCheckpoint.latitude &&
                        locationControl.longitude == locationOfCurrentCheckpoint.longitude)
    }
    
    func test_if_checkpoint_has_been_reached() {
        let treasureHunt = createTreasureHunt()
        let userLocation = UserLocation()
        let hasBeenReached = MapView(treasureHunt: treasureHunt, userLocation: userLocation).checkpointHasBeenReached()
        
        XCTAssertFalse(hasBeenReached)
    }
    
    func test_is_finished() {
        let treasureHunt = createTreasureHunt()
        let userLocation = UserLocation()
        let isFinished = MapView(treasureHunt: treasureHunt, userLocation: userLocation).isFinished()
        
        XCTAssertFalse(isFinished)
    }
    
    func test_update_checkpoint_when_not_reached() {
        let treasureHunt = createTreasureHunt()
        let userLocation = UserLocation()
        
        MapView(treasureHunt: treasureHunt, userLocation: userLocation).updateCheckpoint()()
        let checked = treasureHunt.checkpoints?.sorted(by: { $0.rank < $1.rank })[1].checked
        
        XCTAssertFalse(checked!)
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
        checkpoint.name = "Beuth"
        checkpoint.checked = true
        checkpoint.hint = "You study here."
        checkpoint.locationLatitude = 52.545175
        checkpoint.locationLongitude = 13.3494393
        checkpoint.rank = 0
        checkpoint.treasureHunt = treasureHunt
        
        let checkpoint2 = Checkpoint(entity: checkpointDescription!, insertInto: viewContext)
        checkpoint2.uuid = UUID(uuidString: "53e481f0-70d2-476e-8a12-d9d38e2f4982")!
        checkpoint2.name = "Brandenburger Tor"
        checkpoint2.checked = false
        checkpoint2.hint = "This is a famous sightseeing spot! It's a gate."
        checkpoint2.locationLatitude = 52.5274805
        checkpoint2.locationLongitude = 13.342754
        checkpoint2.rank = 1
        checkpoint2.treasureHunt = treasureHunt
        
        let checkpoint3 = Checkpoint(entity: checkpointDescription!, insertInto: viewContext)
        checkpoint3.uuid = UUID(uuidString: "b1429bf4-626a-4ce1-922f-38ccc41ee94b")!
        checkpoint3.name = "Checkpoint Chalie"
        checkpoint3.checked = false
        checkpoint3.hint = "This is another sightseeing spot. Hint: Charlie"
        checkpoint3.locationLatitude = 52.5075881
        checkpoint3.locationLongitude = 13.3881868
        checkpoint3.rank = 2
        checkpoint3.treasureHunt = treasureHunt
        
        return treasureHunt
    }

}
