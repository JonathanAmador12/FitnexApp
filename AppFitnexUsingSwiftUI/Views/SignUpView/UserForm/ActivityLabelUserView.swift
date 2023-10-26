//
//  ActivityLabelUserView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 23/10/23.
//

import SwiftUI

struct ActivityLabelUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack {
                Text("Physical Activity Lavel")
                    .font(.title)
                    .frame(width: 300, height: 20)
                    .padding(.bottom, 20)
                Text("Choose your regular activity level. This will")
                Text("help us to personalize plans for you")
            }
            
            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Beginer")
                        .foregroundColor(.black)
                })
                .frame(width: 281, height: 51)
                .background(.white)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
                .padding(.bottom, 20)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Intermediate")
                        .foregroundColor(.black)
                })
                .frame(width: 281, height: 51)
                .background(.white)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
                .padding(.bottom, 20)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Advanced")
                        .foregroundColor(.black)
                })
                .frame(width: 281, height: 51)
                .background(.white)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
            }
            .frame(width: 296, height: 500)
            
            HStack(spacing: 16) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                })
                .foregroundColor(.white)
                .frame(width: 150, height: 50)
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 50.0))
                
                NavigationLink {
                    ProfileUserView()
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ActivityLabelUserView()
}
