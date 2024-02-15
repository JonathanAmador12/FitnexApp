//
//  KeyStorageMoock.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 03/02/24.
//

import Foundation

class KeyStorageMock: KeyStorageProtocol {
    var saveToken: Bool
    var isCalledKeychain: Bool
    var triggerBadEncoding: Bool
    
    init(saveToken: Bool) {
        self.saveToken = saveToken
        self.isCalledKeychain = false
        self.triggerBadEncoding = false
    }
    
    func saveTokensToKeychain(accessToken: String, refreshToken: String) throws -> Bool {
        if (triggerBadEncoding) {
            throw APIError.badCoding
        }
        isCalledKeychain = true
        return saveToken
    }
    
}
