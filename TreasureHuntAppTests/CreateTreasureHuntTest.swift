//
//  CreateTreasureHuntTest.swift
//  TreasureHuntAppTests
//
//  Created by Vy on 14.02.21.
//

import XCTest
import CoreData
@testable import TreasureHuntApp

class CreateTreasureHuntTest: XCTestCase {

    private let viewContext = PersistenceController.preview.container.viewContext
    private let huntName = "Hunt name"
    private let huntDescription = "This is a description."

    func test_create_view() {
        let view = CreateTreasureHuntView()
        XCTAssertEqual(view.name, "")
        XCTAssertEqual(view.huntDescription, "")
        XCTAssertEqual(view.checkpoints, [CheckpointCreateModel]())
    }
    
    func skip_test_create_treasure_hunt() {
        let view = CreateTreasureHuntView()
        view.name = self.huntName
        view.huntDescription = self.huntDescription

        view.addTreasureHunt()

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TreasureHunt")
        do {
            let hunts = try viewContext.fetch(fetchRequest) as? [TreasureHunt]
            XCTAssertTrue(huntName == (hunts![0]).name && huntDescription == (hunts![0]).huntDescription)
        } catch {
            fatalError("Failed to fetch hunts: \(error)")
        }
    }
}
