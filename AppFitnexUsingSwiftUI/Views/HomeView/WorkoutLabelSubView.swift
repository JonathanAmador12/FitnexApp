//
//  WorkoutLabelSubView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 16/12/23.
//

import SwiftUI

struct WorkoutLabelSubView: View {
    
    var body: some View {
        
        TrainingLevelView()
        
        ScrollView {
            ForEach( 1...4, id: \.self) {
                _ in
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 331, height: 150)
                        VStack {
                            Spacer()
                                .frame(height: 70)
                            HStack {
                                Text("Squet Movement Exercise")
                                    .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                                Spacer()
                            }
                    
                            HStack {
                                HStack(spacing: 8) {
                                    Text("6 minutes")
                                        .foregroundStyle(.white)
                                    Text("|")
                                        .foregroundStyle(.white)
                                    Text("Intermediate")
                                        .foregroundStyle(.white)
                                }
                                Spacer()
                                Button(action: {
                                    //
                                }, label: {
                                    Image(systemName: "bookmark.fill")
                                        .foregroundColor(.white)
                                })
                            }
                        }
                        .frame(width: 279, height: 55.89)
                    }
                }
            }
        }
    }
}

#Preview {
    WorkoutLabelSubView()
}
