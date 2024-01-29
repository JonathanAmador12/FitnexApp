//
//  DiscoverView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 27/12/23.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        
        VStack {
            HStack {
                HStack {
                    Image("littleLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    
                    Text("Fitnex")
                        .font(.title)
                        .bold()
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)

                })
            }
            .frame(width: 331, height: 25)
            .padding(.bottom, 10)
            WorkoutLabelSubView()
        }
    }
}

#Preview {
    DiscoverView()
}
