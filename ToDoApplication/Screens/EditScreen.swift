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
    
    public var deleteButton: XCUIElement {
        return self.application.buttons["Delete"]
    }
    
    public func tapDeleteButton(){
        deleteButton.tap()
    }
}
