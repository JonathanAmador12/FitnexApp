//
//  SignInViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 03/09/23.
//

import Foundation
import Combine

class SignInViewModel: ObservableObject, SignInViewModelProtocol {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var activeField: SignUpFormField?
    @Published var isPasswordVisible: Bool = false
    @Published var rememberMe: Bool = false
    @Published var internalError: String? = nil
    
    var logInService: LogInServiceProtocol
    var keyStorage: KeyStorageProtocol
    
    init(logInService: LogInServiceProtocol, keyStorage: KeyStorageProtocol) {
        self.logInService = logInService
        self.keyStorage = keyStorage

    }
    
    // functions that validate fields
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
    
    // function which check fields that are activated
    func activateEmail() -> Bool {
        if activeField == .email {
            return true
        } else {
            return false
        }
    }
    
    func activatePassword() -> Bool {
        if activeField == . password {
            return true
        } else {
            return false
        }
    }
    
    // functions that send error messages from fields
    func getEmailErrorMessage(email: String) -> String? {
        let isValidEmail = isValidEmail(email: email)
        
        if isValidEmail == false {
            return "Invalid Email"
        } else {
            return nil
        }
    }
    
    func getPasswordErrorMessage(password: String) -> String? {
        let isValidPassword = isValidPassword(password: password)
        
        if isValidPassword == false {
            return "Invalid Password"
        } else {
            return nil
        }
    }
    
    // functions that retrieve tokens
    func getTokensOfService(credential: Credential) -> Void {
        logInService.getUserOfService(credencial: credential) { Tokens in
            switch Tokens {
            case .success(let tokens):
                do {
                    let areKeepTokens = try self.keyStorage.saveTokensToKeychain(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken)
                    AppStateManger.shared.enterMainView()
                } catch let apiError as APIError {
                    DispatchQueue.main.async {
                        self.internalError = apiError.localizedDescription
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.internalError = error.localizedDescription
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.internalError = error.localizedDescription
                }
            }
        }
    }
}
