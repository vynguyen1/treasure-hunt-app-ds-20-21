//
//  TreasureHuntAppUITests.swift
//  TreasureHuntAppUITests
//
//  Created by Vy on 26.12.20.
//

import XCTest

class StartViewTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    func test_launch_app() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let huntsbutton = app.buttons["Treasure Hunts"]
        let instructionsbutton = app.buttons["Instructions"]
        
        XCTAssertTrue(huntsbutton.exists && instructionsbutton.exists)
    }

    func test_launch_performance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
