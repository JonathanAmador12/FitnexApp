//
//  CreateNewPasswordViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 07/12/23.
//

import Foundation

class CreateNewPasswordViewModel {
    
    func isValidPassword(password: String) -> Bool {
        
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func arePasswordsIqual(newPassword: String, comfirmNewPassword: String) -> Bool {
        
        if isValidPassword(password: newPassword) == true && newPassword == comfirmNewPassword {
            return true
        }
        return false
    }
}
