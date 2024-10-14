//
//  OnboardingAppView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 12/08/23.
//

import SwiftUI

struct OnboardingItemView: View {
    
    var text: String
    var image: UIImage
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.7 )
                    .clipped()
                    .ignoresSafeArea(edges: [.top, .leading, .trailing])
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
        OnboardingItemView(text: "hola", image: UIImage(named: "imageOnboardingExample")!)
    }
}
