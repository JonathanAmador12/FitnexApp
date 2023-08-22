//
//  SignUpView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 17/08/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var isChecked: Bool = false
    
    // Text Field Active
    @State var activeField: ActiveFieldSignUp?
    
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
                        TextField("\(Image(systemName: "envelope.fill"))   Email", text: $email)
                            .frame(width: 300, height: 40)
                            .background(activeField == .textField ?  Color("selectedField"): Color("ColorShadow'sFields"))
                            .onTapGesture {
                                activeField = .textField
                            }
                            .foregroundColor(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        SecureField("\(Image(systemName: "lock.fill"))   Password", text: $password)
                            .frame(width: 300, height: 40)
                            .background(activeField == .secureFieldPassword ? Color("selectedField") : Color("ColorShadow'sFields"))
                            .onTapGesture {
                                activeField = .secureFieldPassword
                            }
                            .foregroundColor(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        SecureField("\(Image(systemName: "lock.fill"))   ComfirmPassword", text: $confirmPassword)
                            .frame(width: 300, height: 40)
                            .background(activeField == .secureFieldConfirPassword ?  Color("selectedField") : Color("ColorShadow'sFields"))
                            .onTapGesture {
                                activeField = .secureFieldConfirPassword
                            }
                            .foregroundColor(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        HStack {
                            Image(systemName: "square")
                                .foregroundColor(.purple)
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
        SignUpView(email: "", password: "", confirmPassword: "")
    }
}
