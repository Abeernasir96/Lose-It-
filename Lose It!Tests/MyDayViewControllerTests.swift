//
//  MyDayViewControllerTests.swift
//  Lose It!Tests
//
//  Created by Abeer Nasir on 16/09/2021.
//

import XCTest
@testable import Lose_It_

class MyDayViewControllerTests: XCTestCase {

    var sut: MyDayViewController!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MyDayViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
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
extension XCTestCase {
    public func perform(event: UIControl.Event, from button: UIControl, target: NSObject, args: Any?) {
        let action = button.actions(forTarget: target, forControlEvent: event)?.first ?? ""
        target.performSelector(onMainThread: Selector(action), with: args, waitUntilDone: true)
    }
    
}
