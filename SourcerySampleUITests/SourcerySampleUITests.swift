//
//  SourcerySampleUITests.swift
//  SourcerySampleUITests
//
//  Created by ShinUnuma on 2019/03/31.
//  Copyright © 2019年 ShinUnuma. All rights reserved.
//

import XCTest

class SourcerySampleUITests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testLogin() {
        let app = XCUIApplication()
        let _ = LoginPage(app: app).assertExists().assertInitValueTextField()
    }
}
