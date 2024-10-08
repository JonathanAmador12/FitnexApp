//
//  HeightUserView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 20/10/23.
//

import SwiftUI

struct HeightUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var heightSelected: Int = 1
    
    var body: some View {
        VStack {
            VStack {
                Text("What is your Height?")
                    .font(.title)
                    .frame(width: 300, height: 20)
                    .padding(.bottom, 20)
                Text("Height in cm, Don't worry you can always \nchange it later")
                    .frame(width: 400)
                
            }
            
            HeightView(heightSelected: $heightSelected)
                .frame(width: 296, height: 500)
            
            HStack(spacing: 16) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                })
                
                NavigationLink {
                    GoalUserView()
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HeightUserView(heightSelected: 1)
}
