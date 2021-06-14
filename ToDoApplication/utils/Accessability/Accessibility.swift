//
//  ToDoScreens.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 24.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import Foundation

/// AccessibilityEnum
fileprivate protocol AccessibilityEnum {
    static func wrapIdentifier(_ label: String) -> String
}

fileprivate extension AccessibilityEnum {
    static func wrapIdentifier(_ label: String) -> String {
        return "\(self).\(label)"
    }
}

enum Accessibility {
    /// InputBar тулбар над клавиатурой с кнопкой Готово
    enum InputBar: AccessibilityEnum {
        public static let View = wrapIdentifier("View")
    }
    
    /// Экраны
    enum Screen {
        enum Root: AccessibilityEnum {
            // Кореневая вьюха модуля
            public static let View = wrapIdentifier("View")
            public static let TaskTable = wrapIdentifier("TaskTable")
            public static let TaskCell = wrapIdentifier("TaskCell")
        }
        
        public enum Task: AccessibilityEnum {
            // root view
            public static let View = wrapIdentifier("View")
            public static let TaskField = wrapIdentifier("TaskField")
            public static let SaveButton = wrapIdentifier("SaveButton")
        }
        
        public enum Edit: AccessibilityEnum {
            // root view
            public static let View = wrapIdentifier("View")
            public static let DeleteButton = wrapIdentifier("DeleteButton")
        }
    }
}
