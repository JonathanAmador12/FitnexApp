//
//  KeychainToKeepTokens.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 11/09/23.
//

import Foundation
import Security

class KeyStorage: KeyStorageProtocol {
    
    func saveTokensToKeychain(accessToken: String, refreshToken: String) throws -> Bool {
        
        guard let accessTokenData = accessToken.data(using: .utf8) else {
            throw APIError.badCoding
        }
        
        guard let refreshTokenData = refreshToken.data(using: .utf8) else {
            throw APIError.badCoding
        }
        
        let accessTokenQuery: [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "myAccessToken",
            kSecValueData as String: accessTokenData,
            kSecAttrService as String: "MyToken"
        ]
        
        let refreshTokenQuery: [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "myRefreshToken",
            kSecValueData as String: refreshTokenData,
            kSecAttrService as String: "MyRefreshToken"
        ]
        
        // we need to delete all ald tokens
        SecItemDelete(accessTokenQuery as CFDictionary)
        SecItemDelete(refreshTokenQuery as CFDictionary)
        
        // we need to keep new tokens
        
        let accessTokenResult = SecItemAdd(accessTokenQuery as CFDictionary, nil)
        let refreshTokenResult = SecItemAdd(refreshTokenQuery as CFDictionary, nil)
        
        if accessTokenResult == errSecSuccess && refreshTokenResult == errSecSuccess {
            print("tokens have kept to keychain")
            return true
        } else {
            print("Tokens haven't kept to keychain")
            return false
        }
    }
}
