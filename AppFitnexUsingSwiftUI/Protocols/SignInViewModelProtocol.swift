//
//  SignInViewModelProtocol.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 02/02/24.
//

import Foundation


protocol SignInViewModelProtocol {
    
    func getTokensOfService(credential: Credential) -> Void
    
}
