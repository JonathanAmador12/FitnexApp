//
//  OnboardingView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 16/08/23.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var appStateManager = AppStateManger.shared
    
    private var onboardingItems:[OnboardingItem] = [
        OnboardingItem(id: 1, image: UIImage(named: "imageOnboardingExample")!, message: "Find the rigth workout for only you"),
        OnboardingItem(id: 2, image: UIImage(named: "imageTwo")!, message: "Make suitable workout and great results"),
        OnboardingItem(id: 3, image: UIImage(named: "imageThree")!, message: "Let's do a workout and live healthy with us")
    ]

    @State private var currentPageIndex = 1

    var body: some View {
        VStack {
            TabView(selection: $currentPageIndex) {
                ForEach(onboardingItems) {onboardingItem in
                    OnboardingItemView(text: onboardingItem.message, image: onboardingItem.image)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea(edges: .top)
            .onAppear {
                setupAppearance()
            }
            
            if currentPageIndex == onboardingItems.count {
                OnboardingNavigationButton(
                    buttonType: .done) {
                        appStateManager.finishOnboarding()
                    }
            } else {
                OnboardingNavigationButton(buttonType: .next) {
                    currentPageIndex += 1
                }
            }
            
            
        }
    }
    
    func setupAppearance() -> Void {
        UIPageControl.appearance().currentPageIndicatorTintColor = .purple
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        // this could be used if there is a Environment
            //.environmentObject(AppStateManger())
    }
}
