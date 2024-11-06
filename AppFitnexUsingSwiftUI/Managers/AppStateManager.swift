//
//  AppStateManager.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 16/08/23.
//

import Foundation

class AppStateManger: ObservableObject {
    
    static let shared = AppStateManger()
    
    @Published var appState: AppState
    
    private var onboardingManager: OnbaordingManager
    private var authManager: AuthManager
    
    private init () {
        onboardingManager = OnbaordingManager()
        authManager = AuthManager()
        
        if let _ = onboardingManager.newitems() {
            appState = .onboarding
        } else if !onboardingManager.hasSeenOnboarding() {
            appState = .onboarding
        } else if !authManager.isAuth() {
            appState = .signIn
        } else {
            appState = .main
        }
    }
    
    
    func finishOnboarding() -> Void {
        appState = .signIn
    }
    
    func signUp() -> Void {
        appState = .signUp
    }
    
    func signIn() -> Void {
        appState = .signIn
    }
    
    func finishSignUp() -> Void {
        appState = .signIn
    }
    
    func finishCreateNewPassword() -> Void {
        appState = .main
    }
    
    func enterMainView() -> Void {
        appState = .main
    }
    
}
