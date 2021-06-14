//
//  ToDoScreens.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 24.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import Foundation

/// Screens.
final class ToDoScreens {
    private let container: ToDoTestCaseDIContainer
    
    init(container: ToDoTestCaseDIContainer) {
        self.container = container
    }
    
    lazy var rootScreen = RoorScreen(application: container.application)
    lazy var taskScreen = TaskScreen(application: container.application)
}
