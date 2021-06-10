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
}
