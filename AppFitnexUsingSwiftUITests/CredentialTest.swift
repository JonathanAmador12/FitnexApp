//
//  CredentialTest.swift
//  AppFitnexUsingSwiftUITests
//
//  Created by JonathanA on 30/01/24.
//

import XCTest
@testable import AppFitnexUsingSwiftUI

final class CredentialTest: XCTestCase {
    
    func testCredential() {
        // Given
        let email: String = "this is an email"
        let password: String = "this is a password"
        
        // when
        
        let user = Credential(email: email, password: password)
        
        // then
        
        XCTAssertEqual(user.email, email)
        XCTAssertEqual(user.password, password)
    }

}
