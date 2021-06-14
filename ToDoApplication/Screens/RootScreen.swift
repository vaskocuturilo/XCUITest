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
    
    public var taskTable: XCUIElement {
        return self.application.tables[Accessibility.Screen.Root.TaskTable]
    }
    
    public func taskCell(named: String) -> XCUIElement {
        let query = self.application.cells.matching(
            NSPredicate(
                format: "identifier == %@ AND label CONTAINS %@",
                Accessibility.Screen.Root.TaskCell,
                named
            )
        )
        
        return query.firstMatch
    }
    
    public var addButton :XCUIElement {
        return self.application.buttons["Add"]
    }
    
    public func tapAddButton(){
        addButton.tap()
    }
    
    public func pickTask(named: String) {
        let taskCell = self.taskCell(named: named)
        taskCell.tap()
    }
}
