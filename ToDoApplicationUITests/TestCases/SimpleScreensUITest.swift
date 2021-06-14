//
//  SimpleScreensUITest.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 14.06.2021.
//  Copyright © 2021 Anton Smirnov. All rights reserved.
//

import XCTest

class SimpleScreensUITest: ToDoTestCase {
    
    func testAddTaskScreensUI() throws {
        waitForElementToAppear(element: screens.rootScreen.root)
        screens.rootScreen.tapAddButton()
        
        waitForElementToAppear(element: screens.taskScreen.root)
        screens.taskScreen.addNewTask(text: "New post for test")
        screens.taskScreen.tapSaveButton()
        
        waitForElementToAppear(element: screens.rootScreen.root)
        
        let message = application.staticTexts["New post for test"]
        XCTAssertTrue(message.waitForExistence(timeout: 5))
    }
    
    func testSimpleDeleteTaskScreensUI() throws {
        waitForElementToAppear(element: screens.rootScreen.root)
        screens.rootScreen.pickTask(named: "New post for test")
        
        waitForElementToAppear(element: screens.editScreen.root)
        screens.editScreen.tapDeleteButton()
        tapAlertButtonIfExists(named: "Ok")
        
        let message = application.staticTexts["New post for test"]
        XCTAssertFalse(message.waitForExistence(timeout: 5))
    }
}
