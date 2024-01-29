//
//  DashboardViewTwo.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/12/23.
//

import SwiftUI

struct DashboardViewTwo: View {
    
    @State var launching: Int = 0
    
    var body: some View {
        TabView(selection: $launching) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            DiscoverView()
                .tabItem {
                    Image(systemName: "pencil.circle.fill")
                    Text("Discover")
                }
            
            Text("Insight")
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("insight")
                }
            
            Text("User")
                .tabItem {
                    Image(systemName: "person")
                    Text("User")
                }
        }
    }
}

#Preview {
    DashboardViewTwo()
}
