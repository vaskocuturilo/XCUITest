//
//  SimpleScreensUITest.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 14.06.2021.
//  Copyright © 2021 Anton Smirnov. All rights reserved.
//

import XCTest

class SimpleScreensUITest: ToDoTestCase {
    
    func testSimpleScreensUI() throws {
        waitForElementToAppear(element: screens.rootScreen.root)
        screens.rootScreen.tapAddButton()
        
        waitForElementToAppear(element: screens.taskScreen.root)
        screens.taskScreen.addNewTask(text: "New post for test")
        screens.taskScreen.tapSaveButton()
        
        waitForElementToAppear(element: screens.rootScreen.root)
        
        let message = application.staticTexts["New post for test"]
        XCTAssertTrue(message.waitForExistence(timeout: 5))
    }
}
