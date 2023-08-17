//
//  AppStateManager.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 16/08/23.
//

import Foundation

class AppStateManger: ObservableObject {
    
    @Published var appState: AppState
    private var onboardingManager: OnbaordingManager
    private var authManager: AuthManager
    
    init () {
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
}
