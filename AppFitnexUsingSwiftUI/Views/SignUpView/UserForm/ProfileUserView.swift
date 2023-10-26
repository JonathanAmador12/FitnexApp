//
//  ProfileUserView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 23/10/23.
//

import SwiftUI

struct ProfileUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var fullName: String = ""
    @State var nickName: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var selectedImage: UIImage?
    @State var isImagePickerPresented = false
    
    var body: some View {
        VStack {
            VStack{
                Text("Fill your Profile")
                    .font(.title)
                    .frame(width: 300, height: 20)
                    .padding(.bottom, 20)
                Text("Don't worry. you can always change it later, or")
                Text("you can skip it for now")
            }
            
            VStack {
                ZStack {
                    if selectedImage != nil {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                        }
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.white)
                            .background(Color("ColorShadow'sFields"))
                            .clipShape(Circle())
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                isImagePickerPresented = true
                            }, label: {
                                Image(systemName: "camera")
                                    .frame(width:30, height: 30)
                                    .foregroundColor(.white)
                                    .background(.purple)
                                    .clipShape(Circle())
                            })
                        }
                        .frame(width: 140)
                    }
                    .frame(height: 190)
                }
            }
            .frame(width: 324, height: 250)
            
            VStack {
                TextField("Full name", text: $fullName)
                    .padding(.horizontal, 20)
                    .frame(width: 324, height: 41)
                    .background(Color("ColorShadow'sFields"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                TextField("Nickname", text: $nickName)
                    .padding(.horizontal, 20)
                    .frame(width: 324, height: 41)
                    .background(Color("ColorShadow'sFields"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("\(Image(systemName: "envelope.fill"))   Email", text: $email)
                    .padding(.horizontal, 20)
                    .frame(width: 324, height: 41)
                    .background(Color("ColorShadow'sFields"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("\("🇨🇦")   phone number", text: $phoneNumber)
                    .padding(.horizontal, 20)
                    .frame(width: 324, height: 41)
                    .background(Color("ColorShadow'sFields"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(width: 324, height: 250)
            .padding(.bottom, 40)
            
            HStack(spacing: 16) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                })
                .foregroundColor(.white)
                .frame(width: 150, height: 50)
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Continue")
                })
                .foregroundColor(.white)
                .frame(width: 150, height: 50)
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePickerTwo(selectedImage: $selectedImage)
        }
    }
}

#Preview {
    ProfileUserView(fullName: "", nickName: "", email: "", phoneNumber: "", selectedImage: nil)
}
