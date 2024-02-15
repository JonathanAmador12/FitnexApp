//
//  CreateUserTokenMock.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 02/02/24.
//

import Foundation

class CreateUserTokenMock: LogInServiceProtocol {
    
    var result: Result<TokenModel, APIError>
    
    init(result: Result<TokenModel, APIError>) {
        self.result = result
    }
    
    func getUserOfService(credencial: AppFitnexUsingSwiftUI.Credential, handler: @escaping (Result<TokenModel, APIError>) -> Void) {
        
        handler(result)
    }
    
}
