//
//  HorrorBoxUITests.swift
//  HorrorBoxUITests
//
//  Created by Hiago Chagas on 11/02/21.
//

import XCTest

class HorrorBoxUITests: XCTestCase {

    func test_isTabBarItemHittable_expectsTrue() {
        let app = XCUIApplication()
        app.launch()
        let tabBarItem01 = XCUIApplication().tabBars["Tab Bar"].buttons["Movies"]
        let tabBarItem02 = XCUIApplication().tabBars["Tab Bar"].buttons["My List"]
        XCTAssertTrue(tabBarItem01.isHittable)
        XCTAssertTrue(tabBarItem02.isHittable)
        tabBarItem02.tap()
    }
    
    func test_isMovieHittable_expectsTrue() {
        let app = XCUIApplication()
        app.launch()
        let firstMovie = app.collectionViews.children(matching: .cell).element(boundBy: 0)
        XCTAssertTrue(firstMovie.isHittable)
    }
    
    func test_areMovieDetailsExisting_expectsTrue() {
        let app = XCUIApplication()
        app.launch()
        let firstMovie = app.collectionViews.children(matching: .cell).element(boundBy: 0)
        firstMovie.tap()
        let saveButton = app.buttons["love"]
        XCTAssertTrue(saveButton.exists)
        let overviewLabel = app.staticTexts["Overview:"]
        XCTAssertTrue(overviewLabel.exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
