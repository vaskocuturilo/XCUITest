//
//  EditScreen.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 14.06.2021.
//  Copyright © 2021 Anton Smirnov. All rights reserved.
//

import Foundation
import XCTest

fileprivate let AccessabilityRoot = Accessibility.Screen.Edit.self
class EditScreen: ToDoPageObject {
    override var root: XCUIElement {
        return self.application.otherElements[AccessabilityRoot.View]
    }
    
    public var taskField :XCUIElement {
        return self.application.textFields[AccessabilityRoot.TaskField]
    }
    
    public var deleteButton: XCUIElement {
        return self.application.buttons["Delete"]
    }
    
    public var saveButton: XCUIElement {
        return self.application.buttons["Save"]
    }
    
    public func tapDeleteButton(){
        deleteButton.tap()
    }
    
    public func editTask(text: String) {
        taskField.tap()
        taskField.typeText(text)
    }
    
    public func tapSaveButton() {
        saveButton.tap()
    }
}
