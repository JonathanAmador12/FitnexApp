//
//  dashboardView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/12/23.
//

import SwiftUI

struct dashboardView: View {
    TabView {
        HomeView()
            .tabItem {
                Image(systemName: "Home")
                Text ("Home")
            }
    }
}

#Preview {
    dashboardView()
}
