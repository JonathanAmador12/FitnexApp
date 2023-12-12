//
//  CongratulationView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 07/12/23.
//

import SwiftUI

struct CongratulationView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 322, height: 386)
            
            VStack(spacing: 60) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.green)
                VStack(spacing: 25) {
                    Text("Congratulations!")
                        .font(.title)
                        .fontWeight(.heavy)
                        
                    Text("Your account is ready to use")
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Go to Home")
                    })
                    .frame(width: 321, height: 41)
                    .foregroundStyle(.white)
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                }
            }
        }
        .frame(width: 322, height: 386)
    }
}

#Preview {
    CongratulationView()
}
