//
//  SignInView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 15/08/23.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var appStateManager: AppStateManger
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("Let's you in")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 300)
                }
                .frame(width: geometry.size.width / 3, height: geometry.size.height / 3)
                
                VStack(spacing: 20) {
                    Button {
                        //
                    } label: {
                        Image("face")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
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
                .frame(width: geometry.size.width / 3, height: geometry.size.height / 3)
                
                VStack(spacing: 35) {
                    ZStack {
                        Divider()
                            .frame(width: 500, height: 2)
                        Text("or")
                            .frame(width: 50)
                            .background(.white)
                    }
                    
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
                        Text("Don't have a account ?")
                            .frame(width: 200)
                        Button {
                            appStateManager.signUp()
                        } label: {
                            Text("Sign Up")
                                .frame(width: 100)
                                .foregroundColor(Color.purple)
                        }

                    }
                }
                .frame(width: geometry.size.width / 3, height: geometry.size.height / 3)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
