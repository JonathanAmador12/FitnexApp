//
//  LoginService1Test.swift
//  AppFitnexUsingSwiftUITests
//
//  Created by JonathanA on 16/02/24.
//

import XCTest
@testable import AppFitnexUsingSwiftUI

final class LoginService1Test: XCTestCase {
    var sut: LogInService!

    override func setUpWithError() throws {
        sut = LogInService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}