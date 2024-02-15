//
//  keyStorageProtocol.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 03/02/24.
//

import Foundation

protocol KeyStorageProtocol {
    func saveTokensToKeychain(accessToken: String, refreshToken: String) throws -> Bool
}
