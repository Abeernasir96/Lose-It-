//
//  CalorieManagerTests.swift
//  Lose It!Tests
//
//  Created by Abeer Nasir on 16/09/2021.
//

import XCTest
@testable import Lose_It_

class CalorieManagerTests: XCTestCase {

    var sut: URLSession!
   

    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = URLSession(configuration: .default)
        
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testValidApiCallGetsHTTPStatusCode200() throws {

      let urlString = "https://api.nutritionix.com/v1_1/search/egg?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=0ddea116&appKey=4c7b2802af333bce4658c3fe891e795c"
        
      
        let url = URL(string: urlString)!
      
         let promise = expectation(description: "Status code: 200")

     
         let dataTask = sut.dataTask(with: url) { _, response, error in
   
           if let error = error {
             XCTFail("Error: \(error.localizedDescription)")
             return
           } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
             if statusCode == 200 {
               
               promise.fulfill()
             } else {
               XCTFail("Status code: \(statusCode)")
             }
           }
         }
         dataTask.resume()
        
         wait(for: [promise], timeout: 5)
       }
    
    func testApiCallCompletes() throws {
      
      let urlString = "https://api.nutritionix.com/v1_1/search/egg?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=0ddea116&appKey=4c7b2802af333bce4658c3fe891e795c"
        
      let url = URL(string: urlString)!
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)

      // then
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
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
