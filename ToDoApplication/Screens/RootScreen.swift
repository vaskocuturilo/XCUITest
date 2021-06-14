//
//  RootScreen.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 24.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import XCTest


/// RootScreen class for add accessibility label.
class RoorScreen: ToDoPageObject {
    override var root: XCUIElement {
        return self.application.otherElements[Accessibility.Screen.Root.View]
    }
    
    public var addButton :XCUIElement {
        return self.application.buttons["Add"]
    }
    
    public func tapAddButton(){
        addButton.tap()
    }
}
