//
//  LoginPage.swift
//  SourcerySampleUITests
//
//  Created by ShinUnuma on 2019/03/31.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import Foundation
import XCTest

class LoginPage {
    let app: XCUIApplication
    let loginIdTitle: XCUIElement
    let passwordTitle: XCUIElement
    let loginIdField: XCUIElement
    let passwordField: XCUIElement
    let loginButton: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        loginIdTitle = app.staticTexts[""]
        loginIdField = app.textFields[""]
        loginButton = app.buttons[""]
    }
}
