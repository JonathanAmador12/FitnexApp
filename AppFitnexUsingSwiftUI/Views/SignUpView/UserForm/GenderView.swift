//
//  GenderView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 13/09/23.
//

import SwiftUI

struct GenderView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            VStack(spacing: 30) {
                Text("Tell us about yourself")
                    .font(.title)
                    .bold()
                    .frame(width: 300)
                VStack {
                    Text("to give you a better experience and result")
                    Text("we need to know your gender")
                }
            }
            
            VStack(spacing: 30) {
                Button {
                    //
                } label: {
                    ZStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("ColorShadow'sFields"))
                            .frame(width: 220, height: 220)
                        VStack {
                            Image("male")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:100, height: 120)
                            Text("Male")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title2)
                        }
                    }
                }

                Button {
                    //
                } label: {
                    ZStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("ColorShadow'sFields"))
                            .frame(width: 220, height: 220)
                        VStack {
                            Image("fimale")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 120)
                            Text("female")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title2)
                        }
                    }
                }
            }
            NavigationLink {
                AgeView()
            } label: {
                Text("Continue")
                    .frame(width: 324, height: 51)
                    .foregroundColor(.white)
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }

        }
        .navigationBarBackButtonHidden(true)
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView()
    }
}
