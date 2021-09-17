//
//  SearchViewControllerTests.swift
//  Lose It!Tests
//
//  Created by Abeer Nasir on 16/09/2021.
//

import XCTest
@testable import Lose_It_

class SearchViewControllerTests: XCTestCase {

    var sut: SearchViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchViewController()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "CreateBudgetViewController")
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
       
    }
    
    func testaddBtnPressed(){
        let button = UIButton()
        button.sendActions(for: .touchUpInside)
        sut.addButtonPressed = button
        XCTAssertNotNil(sut.addButtonPressed)
    }

    
    func testExample() throws {
       
    }

    func testPerformanceExample() throws {
        
        self.measure {
           
        }
    }

}
