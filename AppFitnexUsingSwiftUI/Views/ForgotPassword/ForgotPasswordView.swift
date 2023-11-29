//
//  ForgotPasswordView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 08/11/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var isActiveMessageButton: Bool = false
    @State var isActiveEmailButton: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "arrow.backward")
                    })
                    Text("Forgot Password")
                }
                .frame(width: 219, height: 30)
                Spacer()
            }
            .padding(.bottom, 30)
            
            Image("forgotPassword")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 262, height: 262)
            
            Text("Select which contact details should we use to reset your password")
                .frame(width: 356, height: 50)
                .padding(.bottom, 40)
            
            Button(action: {
                isActiveMessageButton = true
                isActiveEmailButton = false
            }, label: {
                HStack(spacing: 30) {
                    ZStack {
                        Circle()
                            .fill(Color("selectedField"))
                            .frame(width:60, height: 60)
                        Image(systemName: "ellipsis.message.fill")
                            .frame(width:60, height: 60)
                            .foregroundColor(.purple)
                    }
                    VStack {
                        Text("via SMS:")
                        Text("+ 1111 ********99")
                    }
                }
                .frame(width: 223, height: 60)
            })
            .frame(width: 281, height: 92)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isActiveMessageButton == true ? Color.purple : Color.gray)
            }
            .padding(.bottom, 20)
            
            Button(action: {
                isActiveMessageButton = false
                isActiveEmailButton = true
            }, label: {
                HStack(spacing: 30) {
                    ZStack {
                        Circle()
                            .fill(Color("selectedField"))
                            .frame(width:60, height: 60)
                        Image(systemName: "envelope.fill")
                            .frame(width:60, height: 60)
                            .foregroundColor(.purple)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("via Email:")
                        Text("example@gmail.com")
                    }
                }
                .frame(width: 223, height: 60)
            })
            .frame(width: 281, height: 92)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isActiveEmailButton == true ? Color.purple : Color.gray)
            }
            .padding(.bottom, 70)
            
            Button(action: {}, label: {
                Text("Sign in with password")
            })
            .foregroundColor(.white)
            .frame(width: 324, height: 49)
            .background(.purple)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        }
        Spacer()
    }
}

#Preview {
    ForgotPasswordView()
}
