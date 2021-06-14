//
//  SimpleAddNoteTest.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 10.06.2021.
//  Copyright © 2021 Anton Smirnov. All rights reserved.
//

import XCTest

class SimpleAddNoteTest: XCTestCase {
    
    func testSimpleAddNote() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Add"].tap()
        app.textFields.element.tap()
        app.textFields.element.typeText("Simple text")
        app.buttons["Save"].tap()
    }
    
    func testSimpleDeleteNote() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tables.children(matching: .cell).staticTexts["Simple text"].tap()
        app.buttons["Delete"].tap()
        app.buttons["Ok"].tap()
    }
    
    func testSimpleEditNote() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Add"].tap()
        app.textFields.element.tap()
        app.textFields.element.typeText("Simple text")
        app.buttons["Save"].tap()
        
        app.tables.children(matching: .cell).staticTexts["Simple text"].tap()
        sleep(2)
        app.textFields.element.tap()
        app.textFields.element.typeText(" for testing edit tests!")
        app.buttons["Save"].tap()
        
        app.tables.children(matching: .cell).staticTexts["Simple text for testing edit tests!"].tap()
        app.buttons["Delete"].tap()
        app.buttons["Ok"].tap()
    }
}

