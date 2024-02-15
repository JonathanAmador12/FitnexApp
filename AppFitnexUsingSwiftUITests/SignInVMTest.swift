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
        keyStorageMock = KeyStorageMock(saveToken: true)
        sut = SignInViewModel(logInService: mock, keyStorage: keyStorageMock)
    }

    func test_getTokensOfService() {
        // given
        let credential = Credential(email: "pppp", password: "55")
        // when
        sut.getTokensOfService(credential: credential)
        // then
        XCTAssertTrue(keyStorageMock.isCalledKeychain)
        XCTAssertNil(sut.internalError)
    }
    
    func test_getTokensOfService_whenNotStoredOnThekeychain() {
        // given
        let credential = Credential(email: "email", password: "123456789")
        // when
        keyStorageMock.triggerBadEncoding = true
        sut.getTokensOfService(credential: credential)
        //then
        XCTAssertEqual(sut.internalError, APIError.badCoding.errorDescription)
    }
    
    func test_getTokensOfService_failWhenIsNotAuthorized() {
        // given
        mock.result = .failure(APIError.NotAuthorized)
        let credential = Credential(email: "pppp", password: "55")

        // when
        sut.getTokensOfService(credential: credential)

        // then
        XCTAssertFalse(keyStorageMock.isCalledKeychain)
        XCTAssertEqual(sut.internalError, APIError.NotAuthorized.localizedDescription)
    }
    
    func test_getTokensOfService_failWhenIsBadRequest() {
        // given
        mock.result = .failure(.badRequest)
        let credential = Credential(email: "hola", password: "arnol")

        // when
        sut.getTokensOfService(credential: credential)

        // then
        XCTAssertFalse(keyStorageMock.isCalledKeychain)
        XCTAssertEqual(sut.internalError, APIError.badRequest.localizedDescription)
    }
    
    func test_validatedEmailWhenIsRight() {
        // given
        let validEmail = "arnol@gmail.com"
        // when
        let result = sut.isValidEmail(email: validEmail)
        // then
        XCTAssertTrue(result)
    }
    
    func test_validEmailWhenEmailIsInvalid() {
        // given
        let emailWrong = "soy un cheems"
        // when
        let result = sut.isValidEmail(email: emailWrong)
        // thhen
        XCTAssertFalse(result)
    }
    
    func test_validatedPasswordWhenIsRight() {
        // given
        let password = "Passwordtest12"
        // when
        let result = sut.isValidPassword(password: password)
        // then
        XCTAssertTrue(result)
        
    }
    
    func test_validatedPasswordWhenPasswordIsInvalidAndNotToHasCapitalLetter() {
        // given
        let passwordWrong = "password123"
        // when
        let result = sut.isValidPassword(password: passwordWrong)
        // then
       XCTAssertFalse(result)
    }
    
    func test_validatedPasswordWhenPasswordIsInvalidAndNotToHasNumber() {
        // given
        let wrongPassword = "Wrongpassword"
        // when
        let result = sut.isValidPassword(password: wrongPassword)
        // then
        XCTAssertFalse(result)
    }
    
    func test_validatedPasswordWhenPasswordIsInvalidAndHasLessThanEightNumbers() {
        // given
        let wrongPassword = "Homla12"
        // when
        let result = sut.isValidPassword(password: wrongPassword)
        // then
        XCTAssertFalse(result)
    }
    
    func test_activateEmail() {
        // given
        let activeField:SignUpFormField = .email
        // when
        sut.activeField = activeField
        let result = sut.activateEmail()
        // then
        XCTAssertTrue(result)
    }
    
    func test_IsNotActiveEmail() {
        // given
        let activeField: SignUpFormField = .password
        // when
        sut.activeField = activeField
        let result = sut.activateEmail()
        // then
        XCTAssertFalse(result)
    }
    
    func test_activatePassword() {
        // given
        let activeField:SignUpFormField = .password
        // when
        sut.activeField = activeField
        let result = sut.activatePassword()
        // then
        XCTAssertTrue(result)
    }
    
    func test_IsNotActivePassword() {
        // given
        let activeField:SignUpFormField = .email
        // when
        sut.activeField = activeField
        let result = sut.activatePassword()
        // then
        XCTAssertFalse(result)
    }
    
    func test_getEmailErrorMessageWhenTheEmailMeetAllTheConditions() {
        // given
        let email = "arnol123@gmail.com"
        // when
        let result = sut.getEmailErrorMessage(email: email)
        // then
        XCTAssertNil(result)
    }
    
    func test_getEmailErrorMessageWhenTheEmailDoesNotMeetAllConditions() {
        // given
        let wrongEmail = "nosoyunemail"
        // when
        let result = sut.getEmailErrorMessage(email: wrongEmail)
        // then
        XCTAssertNotNil(result)
    }
    
    func test_getPasswordErrorMessageWhenThePasswordMeetAllTheConditions() {
        //given
        let passord: String = "ThePasswordMeetAll12"
        //when
        let result = sut.getPasswordErrorMessage(password: passord)
        // then
        XCTAssertNil(result)
    }
    
    func test_getPasswordErrorMessageWhenThePasswordDoesNotContainsANumber() {
        //given
        let passord: String = "ThePasswordMeetAll"
        //when
        let result = sut.getPasswordErrorMessage(password: passord)
        // then
        XCTAssertNotNil(result)
    }
    
    func test_getPasswordErrorMessageWhenThePasswordDoesNotContainsACapitalLetter() {
        //given
        let passord: String = "thepasswordmeetall12"
        //when
        let result = sut.getPasswordErrorMessage(password: passord)
        // then
        XCTAssertNotNil(result)
    }

    func test_getPasswordErrorMessageWhenLengthIsLessThan8() {
        //given
        let passord: String = "TheP1"
        //when
        let result = sut.getPasswordErrorMessage(password: passord)
        // then
        XCTAssertNotNil(result)
    }
}
