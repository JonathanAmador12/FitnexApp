//
//  ContentView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 12/08/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @EnvironmentObject var appStateManager: AppStateManger

    var body: some View {
//        if appStateManager.appState == .onboarding {
//            OnboardingView()
//        } else if appStateManager.appState == .signIn {
//            SignInView()
//        } else if appStateManager.appState == .signUp {
//            SignUpView()
//        } else if appStateManager.appState == .main {
//            DashboardViewTwo()
//        }
        DashboardViewTwo()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppStateManger())
    }
}
