//
//  SignUpView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 17/08/23.
//

import SwiftUI
import Combine

struct SignUpView: View {
    
    @StateObject var signUpViewModel = SignUpViewModel()
    @State var isPasswordVisible: Bool = false
    @State var isConfirmationPasswordVisible: Bool = false
    @State var rememberPassword: Bool = false
    @FocusState private var focusedField: SignUpFormField?
    
    // erroneous message variable
    @State var emailMessageError: String?
    @State var passwordMessageError: String?
    @State var confirmationPasswordError: String?
    
    
    var body: some View {
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
                    
                    // Email View
                    EmailField(email: $signUpViewModel.email, imageName: "envelope.fill", title: "Email")
                    .textInputAutocapitalization(.never)
                    .foregroundColor(focusedField == .email ? .black : .gray)
                    .frame(width: 300, height: 40)
                    .background(focusedField == .email ?  Color("selectedField"): Color("ColorShadow'sFields"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .focused($focusedField, equals: .email)
                    
                    
                    if let emailError = emailMessageError {
                        Text(emailError)
                            .foregroundColor(.red)
                            .opacity(0.6)
                            .frame(width: 300, height: 20, alignment: .leading)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                        
                    // Password View
                    PasswordTextField(password: $signUpViewModel.password, isFieldVisible: isPasswordVisible, sistemNameImage: "lock.fill", title: "password")
                    .foregroundColor(focusedField == .password ? .black : .gray)
                    .frame(width: 300, height: 40)
                    .background(focusedField == .password ? Color("selectedField") : Color("ColorShadow'sFields"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .focused($focusedField, equals: .password)
                    
                    
                    if let passwordMessage = passwordMessageError {
                        Text(passwordMessage)
                            .foregroundColor(.red)
                            .opacity(0.6)
                            .frame(width: 300, height: 20, alignment: .leading)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    // ConfimPassword View
                    PasswordTextField(password: $signUpViewModel.confirmPassword, isFieldVisible: isConfirmationPasswordVisible, sistemNameImage: "lock.fill", title: "Confirm Password")
                    .foregroundColor(focusedField == .passwordConfirmation ? .black : .gray)
                    .frame(width: 300, height: 40)
                    .background(focusedField == .passwordConfirmation ? Color("selectedField") : Color("ColorShadow'sFields"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .focused($focusedField, equals: .passwordConfirmation)
                    
                    if let messagePasswordConfirmation = confirmationPasswordError {
                        Text(messagePasswordConfirmation)
                            .foregroundColor(.red)
                            .opacity(0.6)
                            .frame(width: 300, height: 20)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    HStack {
                        Button {
                            rememberPassword.toggle()
                        } label: {
                            Image(systemName: rememberPassword ? "checkmark.square" : "square")
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
                        emailMessageError = signUpViewModel.getEmailError()
                        passwordMessageError = signUpViewModel.getPasswordError()
                        confirmationPasswordError = signUpViewModel.getPasswordConfirmationError()
                        signUpViewModel.isActivateSignUp()
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
                        Button {
                            AppStateManger.shared.signIn()
                        } label: {
                            Text("Sign In")
                                .foregroundColor(.purple)
                                .frame(width: 65)
                        }
                    }

                }
                .frame(width: geometry.size.width / 3, height: geometry.size.height / 3)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpView()
        }
    }
}
