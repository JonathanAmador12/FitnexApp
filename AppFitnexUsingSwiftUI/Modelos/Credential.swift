//
//  UserModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 06/09/23.
//

import Foundation

struct Credential: Encodable {
    var email: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case email = "username" // TODO: delete when api is right
        case password
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.password, forKey: .password)
    }
}
