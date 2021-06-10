//
//  ToDoTestCaseDIContainer.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 13.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import Foundation
import XCTest


/// DescriptionToDoTestCaseDIContainer. This is container.
final class ToDoTestCaseDIContainer {
    private(set) lazy var application = XCUIApplication()
    private(set) lazy var screens: ToDoScreens = ToDoScreens(container: self)
    
    
    // MARK: - Init
    init() {
        _ = Bundle(for: ToDoTestCase.self)
    }
}

