//
//  TokenTest.swift
//  AppFitnexUsingSwiftUITests
//
//  Created by JonathanA on 30/01/24.
//

import XCTest
@testable import AppFitnexUsingSwiftUI

final class TokenTest: XCTestCase {
    
    func testToken() {
        // given
        let accessToken: String = "this an accesstoken"
        let refreshToken: String = "this a refreshtoken"
        
        // when
        let token = TokenModel(accessToken: accessToken, refreshToken: refreshToken)
        
        // then
        
        XCTAssertEqual(token.accessToken, accessToken, "exelent")
        XCTAssertEqual(token.refreshToken, refreshToken, "exelent")
    }

}
