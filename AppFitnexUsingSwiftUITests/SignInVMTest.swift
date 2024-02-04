//
//  SignInVMTest.swift
//  AppFitnexUsingSwiftUITests
//
//  Created by JonathanA on 02/02/24.
//

import XCTest
@testable import AppFitnexUsingSwiftUI

final class SignInVMTest: XCTestCase {
    
    var sut: SignInViewModel!
    var mock: CreateUserTokenMock!
    var keyStorageMock: KeyStorageMock!
    
    override func setUp() async throws {
        mock = CreateUserTokenMock(result: .success(TokenModel(accessToken: "ArnolTaken", refreshToken: "ArnolRefreshToken")))
        keyStorageMock = KeyStorageMock(result: true)
        sut = SignInViewModel(logInService: mock, keyStorage: keyStorageMock)
    }

    func test_getTokensOfService() {
        
        // given
        let credential = Credential(email: "pppp", password: "55")
        // when
        sut.getTokensOfService(credential: credential)
        // then
        XCTAssertTrue(keyStorageMock.isCalled)
        XCTAssertNil(sut.internalError)
    }
    
    func test_getTokensOfService_fail() {
        // given
        mock.result = .failure(APIError.NotAuthorized)
        let credential = Credential(email: "pppp", password: "55")
        // when
        sut.getTokensOfService(credential: credential)
        // then
        XCTAssertFalse(keyStorageMock.isCalled)
    }
}
