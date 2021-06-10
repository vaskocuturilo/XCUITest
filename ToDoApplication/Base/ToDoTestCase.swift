//
//  ToDoTestCase.swift
//  ToDoApplicationUITests
//
//  Created by Anton Smirnov on 13.06.2020.
//  Copyright © 2020 Anton Smirnov. All rights reserved.
//

import XCTest

/// Test case class.
class ToDoTestCase: XCTestCase {
    private let container = ToDoTestCaseDIContainer()
    private let springboardApplication = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    func launch() {
        container.application.launchEnvironment["dst_autotest_mode"] = "true"
        container.application.launchArguments.append("-DST_CLEAN_STATE")
        container.application.launch()
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        launch()
    }
    
    override func tearDown() {
        terminate()
        super.tearDown()
    }
    
    func terminate() {
        container.application.terminate()
    }
    
    var screenWaitingSeconds: TimeInterval {
        return 15
    }
    
    var application: XCUIApplication {
        return container.application
    }
    
    var screens: ToDoScreens {
        return container.screens
    }
    
    // MARK: - Public
    /// Function waitForElementToAppear.
    /// - Parameter element: this is XCUIElemnt.
    /// - Parameter timeout: time for delay.
    /// - Parameter file: this is file parametrs for recordFailure (marked).
    /// - Parameter line: this is line parametrs for recordFailure (marked).
    public func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 15,  file: String = #file, line: UInt = #line) {
        let expectation = XCTNSPredicateExpectation(
            predicate: NSPredicate(format: "exists == true"),
            object: element
        )
        let result = XCTWaiter().wait(
            for: [expectation],
            timeout: timeout
        )
        switch result {
        case .completed:
            break
        default:
            let message = "Failed to find \(element) after \(timeout) seconds."
            XCTFail(message)
        }
    }
}
