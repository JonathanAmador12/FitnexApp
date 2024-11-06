//
//  SignUpViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 22/08/23.
//

import Foundation
import Combine
class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    
    func isActivateSignUp() {
        if isEmpyEmail() == true && isValidEmail(email: email) == true && isEmptyPassword() == true && isValidPassword(password: password) == true && isEmptyPasswordConfirmation() == true && ArePasswordAndPasswordConfirmationTheSame(password: password, confirmPassword: confirmPassword) == true {
            AppStateManger.shared.signIn()
        }
    }
    
    // return message if email has been filled
    func getEmailError() -> String? {
        if isEmpyEmail() == false {
            return "Email empty"
        } else if isValidEmail(email: email) == false {
            return "Invalid Email"
        }
        return nil
    }
    
    // return message if password has been filled
    func getPasswordError() -> String? {
        if isEmptyPassword() == false {
            return "Password is Empty"
        } else if isValidPassword(password: password) == false {
            return "Invalid Password"
        }
        return nil
    }
    
    // return message if confirmationPassword has been filled
    func getPasswordConfirmationError() -> String? {
        if isEmptyPasswordConfirmation() == false {
            return "Confirmation Password empty"
        } else if ArePasswordAndPasswordConfirmationTheSame(password: password, confirmPassword: confirmPassword) == false {
            return "los contraseñas no so las mismas"
        }
        return nil
    }
    
    func isEmpyEmail() -> Bool {
        if !email.isEmpty {
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
    
    func isEmptyPasswordConfirmation() -> Bool {
        if !confirmPassword.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    // funtions of field validations
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9]).{8,}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            return passwordPredicate.evaluate(with: password)
    }
    
    func ArePasswordAndPasswordConfirmationTheSame(password: String, confirmPassword: String) -> Bool {
        
        var areTheSame: Bool = false
        
        if isValidPassword(password: password) == true {
            if password == confirmPassword {
                areTheSame = true
            }
        }
        return areTheSame
    }
}
