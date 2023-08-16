//
//  OnboardingNavigationButton.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 14/08/23.
//

import SwiftUI

enum OnboardingNavigationButtonType {
    case next
    case done
}

struct OnboardingNavigationButton: View {
    var buttonType: OnboardingNavigationButtonType
    var functionality: () -> Void
    
    var body: some View {
        Button {
            functionality()
        } label: {
            Text(buttonType == .next ? "Next" : "Done")
                .foregroundColor(.white)
                .frame(width: 324, height: 51)
                .background(.purple, ignoresSafeAreaEdges: [])
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
        }
    }
}

struct OnboardingNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingNavigationButton(
            buttonType: .next) {
                print("Arnol")
            }
    }
}
