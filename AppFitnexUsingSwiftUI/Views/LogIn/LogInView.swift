//
//  LogInView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 31/08/23.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var appStateManager: AppStateManger
    @ObservedObject var signInViewModel = SignInViewModel()
    
    @State var emailErrorMessage: String?
    @State var passwordErrorMessage: String?
    @State var isActiveForgotPasswordView: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("Log in to your Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 324, height: 102)
                        
                }
                .frame(width: geometry.size.width / 4, height: geometry.size.height / 4)
                
                VStack(spacing: 20) {
                    EmailField(email: $signInViewModel.email, imageName: "envelope.fill", title: "Email")
                        .foregroundColor(signInViewModel.activateEmail() ? Color.black: Color.gray)
                        .frame(width: 300, height: 40)
                        .background(signInViewModel.activateEmail() ? Color("selectedField") : Color("ColorShadow'sFields"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            signInViewModel.activeField = .email
                        }
                    
                    if let emailErrorMessage = emailErrorMessage {
                        Text(emailErrorMessage)
                            .foregroundColor(.red)
                            .opacity(0.6)
                            .frame(width: 300, height: 20, alignment: .leading)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    PasswordTextField(password: $signInViewModel.password, isFieldVisible: signInViewModel.isPasswordVisible, sistemNameImage: "lock.fill", title: "Password")
                        .foregroundColor(signInViewModel.activatePassword() ? Color.black : Color.gray)
                        .frame(width: 300, height: 40)
                        .background(signInViewModel.activatePassword() ? Color("selectedField") : Color("ColorShadow'sFields"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            signInViewModel.activeField = .password
                        }
                    
                    if let passwordErrorMessage = passwordErrorMessage {
                        Text(passwordErrorMessage)
                            .foregroundColor(.red)
                            .opacity(0.6)
                            .frame(width: 300, height: 20, alignment: .leading)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    HStack {
                        Button {
                            signInViewModel.rememberMe.toggle()
                        } label: {
                            Image(systemName: signInViewModel.rememberMe ? "checkmark.square" : "square")
                                .foregroundColor(.purple)
                        }
                        Text("Remenber me")
                            .frame(width: 150)
                    }
                    .padding(.trailing, 110)
                }
                .frame(width: geometry.size.width / 4, height: geometry.size.height / 4)
                
                VStack(spacing: 20) {
                    Button {
                        emailErrorMessage = signInViewModel.getEmailErrorMessage(email: signInViewModel.email)
                        
                        passwordErrorMessage = signInViewModel.getPasswordErrorMessage(password: signInViewModel.password)
                        
                        signInViewModel.getTokensOfService(credential: Credential(email: signInViewModel.email, password: signInViewModel.password))
                        
                    } label: {
                        Text("Sign in")
                    }
                    .foregroundColor(.white)
                    .frame(width: 324, height: 51)
                    .background(.purple, ignoresSafeAreaEdges: [])
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        Text("Forgot the password")
                            .foregroundColor(.purple)
                            .frame(width: 250)
                    }

                    ZStack {
                        Divider()
                            .frame(width: 500, height: 2)
                            .background(.gray)
                            .opacity(0.2)
                        Text("Or continue with")
                            .frame(width: 150)
                            .background(.white)
                    }
                    HStack(spacing: 38) {
                        ButtonView(imageName: "face")
                        ButtonView(imageName: "google")
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
                   
                }
                .frame(width: geometry.size.width / 4, height: geometry.size.height / 4)
                
                VStack {
                    HStack(spacing: 5) {
                        Text("Don't have account")
                            .frame(width: 150, height: 20)
                        Button {
                            appStateManager.signUp()
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(.purple)
                                .frame(width: 60, height: 20)
                        }

                    }
                }
                .frame(width: geometry.size.width / 4, height: geometry.size.height / 4)

            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LogInView()
        }
        
    }
}
