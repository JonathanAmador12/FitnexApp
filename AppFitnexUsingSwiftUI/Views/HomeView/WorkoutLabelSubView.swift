//
//  WorkoutLabelSubView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 16/12/23.
//

import SwiftUI

struct WorkoutLabelSubView: View {
    
    var imagenes:[HomeViewPictures] = [
        HomeViewPictures(id: 1, image: "gymOne", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 2, image: "gymTwo", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 3, image: "gymThree", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 4, image: "gymFour", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 5, image: "gymFive", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate")
    ]
    
    var body: some View {
        
        TrainingLevelView()
        
        ScrollView {
            ForEach(imagenes) {
                image in
                ScrollView {
                    ZStack {
                        Image(image.image)
                            .resizable()
                            .frame(width: 331, height: 150)
                            .cornerRadius(10)
                        VStack {
                            Spacer()
                                .frame(height: 70)
                            HStack {
                                Text("Squat Movement Exercise")
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
