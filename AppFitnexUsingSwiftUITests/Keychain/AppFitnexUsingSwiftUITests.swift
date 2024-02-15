//
//  AppFitnexUsingSwiftUITests.swift
//  AppFitnexUsingSwiftUITests
//
//  Created by JonathanA on 29/01/24.
//

import XCTest
@testable import AppFitnexUsingSwiftUI


final class AppFitnexUsingSwiftUITests: XCTestCase {
    
    var keyStorage: KeyStorage!

    override func setUpWithError() throws {
        keyStorage = KeyStorage()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testKeychain() {
        
        // given
        let token = "thisIsToken"
        let refreshToken = "thisIsRefreshToken"
        
        // when
        do {
            let isSaveTokens = try keyStorage.saveTokensToKeychain(accessToken: token, refreshToken: refreshToken)
            XCTAssertTrue(isSaveTokens)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func testKeychainTwo() {
        
        // given
        let token = "thisIsToken"
        let refreshToken = "thisIsRefreshToken"
        
        // when
        do {
            let isSaveTokens = try keyStorage.saveTokensToKeychain(accessToken: token, refreshToken: refreshToken)
            XCTAssertTrue(isSaveTokens)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
