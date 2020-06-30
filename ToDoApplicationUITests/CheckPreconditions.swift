//
//  CheckPreconditions.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 15.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import XCTest


/// Automation scripts for check preconditions
class CheckPreconditions: ToDoTestCase {
    
    func testCheckPreconditions() {
        
        waitForElementToAppear(element: screens.rootScreen.root)
        XCTAssert(screens.rootScreen.root.exists, "Root screem must be open")
    }
    
}
