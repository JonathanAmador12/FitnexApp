//
//  SignInView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 15/08/23.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack {
            Text("Let's you in")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack {
                Button {
                    //
                } label: {
                    Text("Continue with FaceBook")
                }
                .foregroundColor(.black)
                .frame(width: 324, height: 51)
                .background(.white, ignoresSafeAreaEdges: [])
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.purple, lineWidth: 2)
                }
                Button {
                    //
                } label: {
                    Image("google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Text("Continue with Google")
                }
                .foregroundColor(.black)
                .frame(width: 324, height: 51)
                .background(.white, ignoresSafeAreaEdges: [])
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.purple, lineWidth: 2)
                }
                Button {
                    //
                } label: {
                    Image(systemName: "apple.logo")
                    Text("Continue with Apple")
                }
                .foregroundColor(.black)
                .frame(width: 324, height: 51)
                .background(.white, ignoresSafeAreaEdges: [])
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.purple, lineWidth: 2)
                }
            }
            
            Text("or")
            
            Button {
                //
            } label: {
                Text("Sign In with Password")
            }
            .foregroundColor(.white)
            .frame(width: 324, height: 51)
            .background(.purple, ignoresSafeAreaEdges: [])
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            HStack {
                Text("Don't have a account")
                Button {
                    //
                } label: {
                    Text("Sign Up")
                        .foregroundColor(Color.purple)
                }

            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
