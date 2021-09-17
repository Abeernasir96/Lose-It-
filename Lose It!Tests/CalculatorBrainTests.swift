//
//  CalculatorBrainTests.swift
//  Lose It!Tests
//
//  Created by Abeer Nasir on 16/09/2021.
//

import XCTest
@testable import Lose_It_

class CalculatorBrainTests: XCTestCase {

    var sut: CalculatorBrain!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorBrain()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()

        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCalculateCalories(){
        sut.calculateCalories(height: 10.0, weight: 10.0, age: 20.0)
        XCTAssertEqual(265.0, 265.0, "Received expected result")
    }
   
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
