//
//  CreateTreasureHuntViewTest.swift
//  TreasureHuntAppUITests
//
//  Created by Vy on 14.02.21.
//

import XCTest

class CreateCheckpointViewTest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func test_create_hunt() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Treasure Hunts"].tap()
        app.buttons["plus.circle"].tap()
        app.buttons["Add Checkpoint"].tap()
        
        // Given
        let detailsText = app.staticTexts["DETAILS"]
        let coordinatesText = app.staticTexts["COORDINATES"]
        
        XCTAssertTrue(detailsText.exists && coordinatesText.exists)
    }

}
