//
//  TrainingLevelView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 19/12/23.
//

import SwiftUI

struct TrainingLevelView: View {
    
    @State var trainingLabel: TrainingLabel?
    
    var body: some View {
        HStack {
            Button(action: {
                //
            }, label: {
                Text("Biginner")
                    .frame(width: 87, height: 27)
                    .foregroundColor(.black)
                    .background(trainingLabel == .biginner ? .purple.opacity(0.2) : .white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .onTapGesture {
                        trainingLabel = .biginner
                    }
            })
            
            Spacer()
            
            Button(action: {
                //
            }, label: {
                Text("Intermediate")
                    .frame(width: 113, height: 27)
                    .foregroundColor(.black)
                    .background(trainingLabel == .intermediate ? .purple.opacity(0.2) : .white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .onTapGesture {
                        trainingLabel = .intermediate
                    }
            })
            
            Spacer()
            
            Button(action: {
                //
            }, label: {
                Text("Advanced")
                    .frame(width: 97, height: 27)
                    .foregroundColor(.black)
                    .background(trainingLabel == .advanced ? .purple.opacity(0.2) : .white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .overlay (
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .onTapGesture {
                        trainingLabel = .advanced
                    }
            })
           
        }
        .frame(width: 335, height: 27)
        .padding(.bottom, 30)
        .onAppear {
            trainingLabel = .intermediate
        }
    }
}

#Preview {
    TrainingLevelView()
}
