//
//  GoalUserView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 23/10/23.
//

import SwiftUI

struct GoalUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Text("What is your Goal?")
                    .font(.title)
                    .padding(.bottom, 20)
                Text("you can choose more than one, Don't worry,")
                    
                Text("you can change it later")
            }
            .frame(width: 281, height: 100)
            .padding(.bottom, 21)
            
            VStack {
                Button(action: {}, label: {
                    HStack {
                        Text("Get Fitter")
                            .foregroundColor(.black)
                        Spacer()
                    }
                })
                .padding(20)
                .frame(width: 281, height: 51)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Text("Gain weight")
                            .foregroundColor(.black)
                        Spacer()
                    }
                })
                .padding(20)
                .frame(width: 281, height: 51)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Text("Lose Weight")
                            .foregroundColor(.black)
                        Spacer()
                    }
                })
                .padding(.horizontal, 20)
                .frame(width: 281, height: 51)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Text("Building Muscles")
                            .foregroundColor(.black)
                        Spacer()
                    }
                })
                .padding(.horizontal, 20)
                .frame(width: 281, height: 51)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Text("Improving Endurance")
                            .foregroundColor(.black)
                        Spacer()
                    }
                })
                .padding(.horizontal, 20)
                .frame(width: 281, height: 51)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Text("Others")
                            .foregroundColor(.black)
                        Spacer()
                    }
                })
                .padding(.horizontal, 20)
                .frame(width: 281, height: 51)
                .border(.purple, width: 0.5)
                .clipShape(RoundedRectangle(cornerRadius: 2.2))
            }
            .frame(width: 281, height: 426)
            .padding(.bottom, 70)
            
            HStack(spacing: 16) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50.0))
                })
                
                NavigationLink {
                    ActivityLabelUserView()
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50.0))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GoalUserView()
}
