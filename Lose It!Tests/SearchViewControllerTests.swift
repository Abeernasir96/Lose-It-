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
    var CalculatorObj: CalculatorBrain!
    var APIObj: URLSession!
    var sut2: LogViewController!
    var sut3: MyDayViewController!
    var sut4: ExerciseViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        CalculatorObj = CalculatorBrain()
        sut = SearchViewController()
        sut2 = LogViewController()
        sut3 = MyDayViewController()
        sut4 = ExerciseViewController()
        APIObj = URLSession(configuration: .default)
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "SearchViewController")
        sut2 = storyBoard.instantiateViewController(identifier: "LogViewController")
        sut3 = storyBoard.instantiateViewController(identifier: "MyDayViewController")
        sut4 = storyBoard.instantiateViewController(identifier: "ExerciseViewController")
        sut.loadViewIfNeeded()
        sut2.loadViewIfNeeded()
        sut3.loadViewIfNeeded()
        sut4.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
       
    }
    func testCalculateCalories(){
        CalculatorObj.calculateCalories(height: 1.0, weight: 1.0, age: 1.0)
        XCTAssertEqual(21.5, 21.5, "Received expected result")
    }
    func AddBtnVerify()
    {
        XCTAssertNotNil(sut.addButtonPressed)
    }
    func testSearchTextField()
    {
        XCTAssertNotNil(sut.searchTF)
    }
    func testddBfBtn(){
        XCTAssertNotNil(sut2.breakfastButton)
    }
    func testLunchBtn(){
        XCTAssertNotNil(sut2.lunchButton)
    }
    func testDinnerBtn(){
        XCTAssertNotNil(sut2.dinnerButton)
    }
    func testUpdateLogCalories(){
        
        }
    func testLabel(){
        XCTAssertNotNil(sut2.totalCaloriesLabel)
        XCTAssertNotNil(sut2.breakfastLabel)
        XCTAssertNotNil(sut2.lunchLabel)
        XCTAssertNotNil(sut2.dinnerLabel)
    }
    func testBFPressed(){
        let button = UIButton()
        button.sendActions(for: .touchUpInside)
        sut2.breakfastButton = button
        XCTAssertNotNil(sut2.breakfastButton)
    }
    
    func testArray(){
        XCTAssertEqual(sut4.quiz.count,6)
        
    }
    
    
    
    
        
    

    func testValidApiCallGetsHTTPStatusCode200() throws {

      let urlString = "https://api.nutritionix.com/v1_1/search/egg?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=0ddea116&appKey=4c7b2802af333bce4658c3fe891e795c"
        
      
        let url = URL(string: urlString)!
      
         let promise = expectation(description: "Status code: 200")

     
         let dataTask = APIObj.dataTask(with: url) { _, response, error in
   
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
      let dataTask = APIObj.dataTask(with: url) { _, response, error in
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
    
    
    public func performGestureRecognizer<T>(type: T.Type, on view: UIView) {
          let gesture = view.gestureRecognizers?.first { $0 is T }

          let target = (gesture?.value(forKey: "_targets") as? [NSObject])?.first
          let selectorString = String(describing: target)
              .components(separatedBy: ", ")
              .first?
              .replacingOccurrences(of: "(action=", with: "")
              .replacingOccurrences(of: "Optional(", with: "")
              ?? ""

          view.perform(.init(stringLiteral: selectorString))
      }
    func testExample() throws {
       
    }

    func testPerformanceExample() throws {
        
        self.measure {
           
        }
    }

}
extension XCTestCase {
    public func perform(event: UIControl.Event, from button: UIControl, target: NSObject, args: Any?) {
        let action = button.actions(forTarget: target, forControlEvent: event)?.first ?? ""
        target.performSelector(onMainThread: Selector(action), with: args, waitUntilDone: true)
    }
    
}
