//
//  SignUpViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 22/08/23.
//

import Foundation
import Combine
class SignUpViewModel: ObservableObject {
    
    @Published var activeField: SignUpFormField?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    
    func isActivateSignUp() -> Bool {
        if !isEmpyEmail() && isValidEmail(email: email) && !isEmptyPassword() && isValidPassword(password: password) && !isEmptyPasswordConfirmation() && !ArePasswordAndPasswordConfirmationTheSame(password: password, confirmPassword: confirmPassword) {
            return true
        } else {
            return false
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
    
    // active eye slash
    
//    func isActiveEyeSlash() -> Bool {
//        var Active = false
//        r
//    }
}
