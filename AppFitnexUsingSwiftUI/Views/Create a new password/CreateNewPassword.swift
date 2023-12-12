//
//  CreateNewPassword.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 05/12/23.
//

import SwiftUI

struct CreateNewPassword: View {
    
    var vm = CreateNewPasswordViewModel()
    
    @State var newPassword: String = ""
    @State var confirmNewPassord: String = ""
    @State var isActiveCongratulationView: Bool = false
    
    @State var isNewPasswordVisible: Bool = false
    @State var isConfirmNewPasswordVisible: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "arrow.backward")
                        Text("Create a new passord")
                    }
                    .frame(width: 219, height: 30)
                    Spacer()
                }
                Spacer()
                Image("createNewPassword", bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 298, height: 237)
                Spacer()
                Text("Create a new password")
                    .frame(width: 146, height: 17)
                    .padding(.trailing, 200)
                    .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    
                    ZStack{
                        NewPasswordView()
                        HStack {
                            Image(systemName: "lock.fill")
                            Spacer()
                            Button(action: {
                                isNewPasswordVisible.toggle()
                            }, label: {
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(.black)
                            })
                        }
                        .frame(width: 280, alignment: .center)
                    }
                    .frame(width: 324, height: 40)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    ZStack {
                        ConfirmNewPassordView()
                        HStack {
                            Image(systemName: "lock.fill")
                            Spacer()
                            Button(action: {
                                isConfirmNewPasswordVisible.toggle()
                            }, label: {
                                Image(systemName: "eye.slash.fill")
                                    .foregroundStyle(.black)
                            })
                        }
                        .frame(width: 280, alignment: .center)
                    }
                    .frame(width: 324, height: 40)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(width: 324, height: 104)
                Spacer()
                Button(action: {
                    isActiveCongratulationView = vm.arePasswordsIqual(newPassword: newPassword, comfirmNewPassword: confirmNewPassord)
                }, label: {
                    Text("Continue")
                        .foregroundStyle(.white)
                        .frame(width: 324, height: 49)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                })
//                .sheet(isPresented: $isActiveCongratulationView, content: {
//                    CongratulationView()
//                })
            }
            if isActiveCongratulationView {
                ZStack {
                    backgroundGrey()
                    CongratulationView()
                        .frame(width: 322, height: 386)
                        .background(.gray.opacity(0.2))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func NewPasswordView() -> some View {
        if isNewPasswordVisible == false {
            SecureField(text: $newPassword) {
                Text("")
            }
            .frame(width: 220, alignment: .center)
        } else {
            TextField("", text: $newPassword).frame(width: 220, alignment: .center)
        }
    }
    
    @ViewBuilder
    func ConfirmNewPassordView() -> some View {
        if isConfirmNewPasswordVisible == false {
            SecureField(text: $confirmNewPassord) {
                Text("")
            }
            .frame(width: 220, alignment: .center)
        } else {
            TextField("", text: $confirmNewPassord)
                .frame(width: 220, alignment: .center)
        }
    }
    
}

#Preview {
    CreateNewPassword()
}
