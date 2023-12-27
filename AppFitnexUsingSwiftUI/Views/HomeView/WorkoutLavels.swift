//
//  WorkoutLavels.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 13/12/23.
//

import SwiftUI

struct WorkoutLavels: View {

    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                    })
                    
                    Text("Workout Levels")
                        .font(.title)
                        .fontWidth(.standard)
                }
                Spacer()
                Button(action: {
                    //
                }, label: {
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                })
            }
            .frame(width: 331, height: 30)
            .padding(.bottom, 40)
            
            WorkoutLabelSubView()
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    WorkoutLavels()
}
