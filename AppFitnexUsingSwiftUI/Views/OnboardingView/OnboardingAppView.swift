//
//  OnboardingAppView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 12/08/23.
//

import SwiftUI

struct OnboardingAppView: View {
    
    var text: String
    var image: UIImage
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: proxy.frame(in: .global).height / 2)
                    .ignoresSafeArea(edges: [.top])
                    .padding(.bottom, 50)
                
                Text(text)
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct OnboardingAppView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingAppView(text: "hola", image: UIImage(named: "imageOnboardingExample")!)
    }
}
