//
//  SignInView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 15/08/23.
//

import SwiftUI


struct SignInMethod: Hashable {
    var name: String
    var image: String
    var imageType: SignInMethodImageType
}

enum SignInMethodImageType {
    case asset
    case sf
}

struct SignInView: View {
    
    @EnvironmentObject var appStateManager: AppStateManger
    
    var signInMethods: [SignInMethod] = [
        SignInMethod(name: "Continue with Facebook", image: "face", imageType: .asset),
        SignInMethod(name: "Continue with Google", image: "google", imageType: .asset),
        SignInMethod(name: "Continue with Apple", image: "apple.logo", imageType: .sf),
    ]
    
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
                    
                    ForEach(signInMethods, id: \.self) { signInMethod in
                        Button {
                            //
                        } label: {
                            if signInMethod.imageType == .asset {
                                HStack(spacing: 30) {
                                    Image(signInMethod.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 45)
                                    Text(signInMethod.name)
                                }
                            } else {
                                HStack(spacing: 30) {
                                    Image(systemName: signInMethod.image)
                                    Text(signInMethod.name)
                                }
                            }
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
