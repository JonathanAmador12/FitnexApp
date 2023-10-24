//
//  Extension of String.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 17/10/23.
//

import Foundation

extension String {
    func verticalText() -> String {
        var result = ""
        
        for character in self {
            result.append("\(character)\n")
        }
        return result
    }
}
