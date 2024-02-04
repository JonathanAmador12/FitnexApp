//
//  KeyStorageMoock.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 03/02/24.
//

import Foundation

class KeyStorageMock: KeyStorageProtocol {
    var result: Bool
    var isCalled: Bool
    
    init(result: Bool) {
        self.result = result
        self.isCalled = false
    }
    
    func saveTokensToKeychain(accessToken: String, refreshToken: String) throws -> Bool {
        isCalled = true
        return result
    }
    
}
