//
//  NoteScreen.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 14.06.2021.
//  Copyright © 2021 Anton Smirnov. All rights reserved.
//

import Foundation
import XCTest

fileprivate let AccessabilityRoot = Accessibility.Screen.Task.self
class TaskScreen: ToDoPageObject {
    override var root: XCUIElement {
        return self.application.otherElements[AccessabilityRoot.View]
    }
    
    public var taskField :XCUIElement {
        return self.application.textFields[AccessabilityRoot.TaskField]
    }
    
    public var saveButton :XCUIElement {
        return self.application.buttons["Save"]
    }
    
    public func addNewTask(text: String){
        taskField.tap()
        taskField.typeText(text)
    }
    
    public func tapSaveButton(){
        saveButton.tap()
    }
}
