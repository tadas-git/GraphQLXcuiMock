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
    let GQLFindAllUsersRequest = "graphql_FindAllUsers"
    let GQLGetEmailRequest = "graphql_GetEmail"
    
    override func setUp() {
        requests[GETQuestionURL] = ["RestQuestionResponse"]
        requests[GQLGetEmailRequest] = ["GetEmail"]
        requests[GQLFindAllUsersRequest] = ["findAllUsers"]
        super.setUp()
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.navigationBars["Top Question"].staticTexts["Top Question"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2,174"]/*[[".cells.staticTexts[\"2,174\"]",".staticTexts[\"2,174\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["ios, cocoa-touch, uikit, uilabel, text-alignment"]/*[[".cells.staticTexts[\"ios, cocoa-touch, uikit, uilabel, text-alignment\"]",".staticTexts[\"ios, cocoa-touch, uikit, uilabel, text-alignment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

}
