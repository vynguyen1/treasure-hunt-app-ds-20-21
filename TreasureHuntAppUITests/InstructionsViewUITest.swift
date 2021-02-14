//
//  DetailedHuntViewUITest.swift
//  TreasureHuntAppUITests
//
//  Created by Vy on 14.02.21.
//

import XCTest
import SwiftUI
@testable import TreasureHuntApp

class InstructionsViewUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_instructions_view() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Instructions"].tap()
        
        let text = app.staticTexts["This app enables you to create your own treasure hunts that you can use to go on little adventures with. :)"]
        
        XCTAssertTrue(text.exists)
    }
}
