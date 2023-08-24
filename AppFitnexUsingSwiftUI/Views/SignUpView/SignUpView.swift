//
//  SignUpView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 17/08/23.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                VStack {
                    VStack{
                        Text("Create your Account")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(width: 300)
                    }
                    .frame(width: geometry.size.width / 3, height: geometry.size.height / 3)
                    
                    VStack(spacing: 18) {
                        
                        HStack(spacing: 20) {
                            Image(systemName: "envelope.fill")
                            TextField("Email", text: $signUpViewModel.email)
                                .onTapGesture {
                                    signUpViewModel.activeField = .email
                                }
                        }
                        .foregroundColor(signUpViewModel.isEmailActiveOrFill() ? .black : .gray)
                        .frame(width: 300, height: 40)
                        .background(signUpViewModel.isActiveEmail() ?  Color("selectedField"): Color("ColorShadow'sFields"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            
                        HStack(spacing: 20) {
                            Image(systemName: "lock.fill")
                            TextField("Password", text: $signUpViewModel.password)
                                .onTapGesture {
                                    signUpViewModel.activeField = .password
                                }
                            Button {
                                //
                            } label: {
                                Image(systemName: "eye.slash.fill")
                            }

                        }
                        .foregroundColor(signUpViewModel.isPasswordActiveOrFill() ? .black : .gray)
                        .frame(width: 300, height: 40)
                        .background(signUpViewModel.isActivePassword() ? Color("selectedField") : Color("ColorShadow'sFields"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        HStack {
                            Image(systemName: "lock.fill")
                            TextField("Confirm Password", text: $signUpViewModel.confirmPassword)
                                .onTapGesture {
                                    signUpViewModel.activeField = .passwordConfirmation
                                }
                            
                            Button {
                                //
                            } label: {
                                Image(systemName: "eye.slash.fill")
                            }

                        }
                        .foregroundColor(signUpViewModel.isPasswordConfirmationActiveOrFill() ? .black : .gray)
                        .frame(width: 300, height: 40)
                        .background(signUpViewModel.isActivePasswordConfirmation() ? Color("selectedField") : Color("ColorShadow'sFields"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        HStack {
                            Button {
                                //
                            } label: {
                                Image(systemName: "square")
                                    .foregroundColor(.purple)
                            }

                            Text("Remember me")
                                .frame(width: 150)
                        }
                        .padding(.trailing, 110)
                    }
                    .frame(width: geometry.size.width / 3, height: geometry.size.height / 3)
                    
                    VStack(spacing: 20) {
                        Button {
                            //
                        } label: {
                            Text("Sign Up")
                        }
                        .foregroundColor(.white)
                        .frame(width: 324, height: 51)
                        .background(.purple, ignoresSafeAreaEdges: [])
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        ZStack {
                            Divider()
                                .frame(width: 500, height: 2)
                                .background(Color.gray)
                            Text("Or continue with")
                                .frame(width: 150)
                                .background(Color.white)
                        }
                        
                        HStack(spacing: 50) {
                            ButtonView(imageName: "google")
                            ButtonView(imageName: "face")
                            Button {
                                //
                            } label: {
                                Image(systemName: "apple.logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                            }


                        }
                        
                        HStack {
                            Text("Already have an account ?")
                                .frame(width: 200)
                            Text("Sign In")
                                .foregroundColor(.purple)
                                .frame(width: 65)
                        }

                    }
                    .frame(width: geometry.size.width / 3, height: geometry.size.height / 3)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            }
            
            
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
