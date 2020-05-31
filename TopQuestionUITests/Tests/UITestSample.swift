//
//  UITestSample.swift
//  TopQuestionUITests
//
//  Created by Tadas Stankevicius on 30/05/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import XCTest

class UITestSample: BaseTest {
    
    let GETQuestionURL = "/questions?site=stackoverflow&order=desc&sort=votes&tagged=ios"
    
    override func setUp() {
        requests[GETQuestionURL] = ["RestQResponse"]
        super.setUp()
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.navigationBars["Top Question"].staticTexts["Top Question"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2,174"]/*[[".cells.staticTexts[\"2,174\"]",".staticTexts[\"2,174\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["ios, cocoa-touch, uikit, uilabel, text-alignment"]/*[[".cells.staticTexts[\"ios, cocoa-touch, uikit, uilabel, text-alignment\"]",".staticTexts[\"ios, cocoa-touch, uikit, uilabel, text-alignment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()        
    }

}
