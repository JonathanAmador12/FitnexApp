//
//  SignInViewModelProtocol.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 01/02/24.
//

import Foundation

protocol LogInServiceProtocol {
    func getUserOfService(credencial: Credential, handler: @escaping (Result<TokenModel, APIError>) -> Void)
    
}
