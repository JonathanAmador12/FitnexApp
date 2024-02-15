//
//  APIErrors.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 06/09/23.
//

import Foundation

enum APIError: LocalizedError {
    case badRequest
    case badURL
    case NotAuthorized
    case badCoding
    case badDecoude
    
    var errorDescription: String? {
        switch self {
        case .NotAuthorized:
            return "Errror en la autenticacion"
        case .badCoding:
            return "adsf"
        case .badDecoude:
            return "adsf"
        case .badRequest:
            return "adsf"
        case .badURL:
            return "adsf"
        }
    }
}
