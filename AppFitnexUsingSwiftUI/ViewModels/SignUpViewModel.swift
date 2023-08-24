//
//  SignUpViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 22/08/23.
//

import Foundation


class SignUpViewModel: ObservableObject {
    @Published var activeField: SignUpFormField?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    // functions emails
    func isActiveEmail() -> Bool {
        if activeField == .email {
            return true
        } else {
            return false
        }
    }
    
    func isEmpyEmail() -> Bool {
        if !email.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func isEmailActiveOrFill() -> Bool {
        if isActiveEmail() == true || isEmpyEmail() == true {
            return true
        } else {
            return false
        }
    }
    
    // functions password
    func isActivePassword() -> Bool {
        if activeField == .password {
            return true
        } else {
            return false
        }
    }
    
    func isEmptyPassword() -> Bool {
        if !password.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func isPasswordActiveOrFill() -> Bool {
        if isActivePassword() == true || isEmptyPassword() == true {
            return true
        } else {
            return false
        }
    }
    
    // passwords confirmation password
    
    func isActivePasswordConfirmation() -> Bool {
        if activeField == .passwordConfirmation {
            return true
        } else {
            return false
        }
    }
    
    func isEmptyPasswordConfirmation() -> Bool {
        if !confirmPassword.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func isPasswordConfirmationActiveOrFill() -> Bool {
        
        if isActivePasswordConfirmation() == true || isEmptyPasswordConfirmation() == true {
            return true
        } else {
            return false
        }
    }
}
