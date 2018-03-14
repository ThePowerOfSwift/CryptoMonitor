//
//  WaitForKeyboard.swift
//  CryptoMonitorUITests
//
//  Created by Serg Liamthev on 3/14/18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
        let keyboard = XCUIApplication().keyboards.element
        while (true) {
            element.tap()
            if keyboard.exists {
                break
            }
            RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 0.5) as Date)
        }
    }
}
