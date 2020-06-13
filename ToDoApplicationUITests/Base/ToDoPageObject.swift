//
//  ToDoPageObject.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 13.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import XCTest

/// DescriptionToDoPageObject. This is Page object.
class ToDoPageObject {
    let application: XCUIApplication
    
    
    // MARK: - Init
    init(application: XCUIApplication) {
        self.application = application
    }
    
    var root: XCUIElement {
        fatalError("Use subclass of ToDoPageObject instead base class")
    }
}
