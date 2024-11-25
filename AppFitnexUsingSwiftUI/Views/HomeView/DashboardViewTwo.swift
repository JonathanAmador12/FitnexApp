//
//  DashboardViewTwo.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/12/23.
//

import SwiftUI

struct DashboardViewTwo: View {
    
    enum Tab: Hashable {
        case home, discover, insight, user
    }
    
    @State private var launching:Tab = .home
    
    var body: some View {
        
        TabView(selection: $launching) {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "pencil.circle.fill")
                }
            
            Text("Insight")
                .tabItem {
                    Label("insight", systemImage: "chart.bar.xaxis")
                }
            
            Text("User")
                .tabItem {
                    Label("User", systemImage: "person")
                }
        }
    }
}

#Preview {
    DashboardViewTwo()
}
