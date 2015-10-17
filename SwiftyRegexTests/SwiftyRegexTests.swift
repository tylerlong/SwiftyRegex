//
//  SwiftyRegexTests.swift
//  SwiftyRegexTests
//
//  Created by Tyler Long on 17/10/2015.
//  Copyright © 2015 Tylingsoft. All rights reserved.
//

import XCTest
@testable import SwiftyRegex

class SwiftyRegexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMatch() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue("123456" =~ "^\\d+$")
    }

    func testSub() {
        XCTAssertTrue("2bb" == "bbb".sub("b", withString: "2"))
    }

    func testGsub() {
        XCTAssertTrue("222" == "bbb".gsub("b", withString: "2"))
    }

    func testScan() {
        XCTAssertTrue(["123", "456", "7890"] == "(123) 456-7890".scan("\\d+"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
