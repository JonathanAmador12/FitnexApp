//
//  HomeView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 12/12/23.
//

import SwiftUI

struct HomeView: View {
    var imageList:[HomeViewPictures] = [
        HomeViewPictures(id: 1, image: "gymOne", title: "Full Body Stretching", time: "12 minutes", level: "Intermediate"),
        HomeViewPictures(id: 2, image: "gymTwo", title: "Full Body Stretching", time: "15 minutes", level: "Intermediate"),
        HomeViewPictures(id: 3, image: "gymThree", title: "Full Body Stretching", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 4, image: "gymFour", title: "Full Body Stretching", time: "20 minutes", level: "Intermediate"),
        HomeViewPictures(id: 5, image: "gymFive", title: "Full Body Stretching", time: "18 minutes", level: "Intermediate"),
        HomeViewPictures(id: 6, image: "gymSix", title: "Full Body Stretching", time: "14 minutes", level: "Intermediate"),
        HomeViewPictures(id: 7, image: "gymSeven", title: "Full Body Stretching", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 8, image: "gymEight", title: "Full Body Stretching", time: "19 minutes", level: "Intermediate"),
        HomeViewPictures(id: 9, image: "gymNine", title: "Full Body Stretching", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 10, image: "gymTen", title: "Full Body Stretching", time: "10 minutes", level: "Intermediate")
    ]
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 10) {
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
                        
                        HStack(spacing: 30) {
                            Button(action: {}, label: {
                                Image(systemName: "bell")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                                
                            })
                            
                            NavigationLink {
                                MyBookMarkView()
                            } label: {
                                Image(systemName: "bookmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }
                    .frame(width: 331, height: 25)
                    
                    HStack {
                        Text("Morning Lolla")
                            .font(.system(size: 30))
                            .frame(width: 204, height: 40)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                .frame(width: 331)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(imageList) {image in
                            ZStack {
                                Image(image.image)
                                    .resizable()
                                    .frame(width: 260, height: 286)
                                VStack {
                                    Spacer()
                                        .frame(height: 180)
                                    VStack(spacing: 3) {
                                        
                                        Text(image.title)
                                            .foregroundStyle(.white)
                                            .font(.title)
                                            .frame(width: 217, height: 17)
                                            .minimumScaleFactor(0.8)
                                        
                                        HStack {
                                            HStack(spacing: 5) {
                                                Text(image.time)
                                                    .foregroundStyle(.white)
                                                    .font(.subheadline)
                                                Text("|")
                                                    .foregroundStyle(.white)
                                                    .font(.subheadline)
                                                Text(image.level)
                                                    .foregroundStyle(.white)
                                                    .font(.subheadline)
                                            }
                                            Spacer()
                                            Button(action: {
                                                //
                                            }, label: {
                                                Image(systemName: "bookmark")
                                                    .foregroundColor(.white)
                                            })
                                            
                                        }
                                        .frame(width: 217, height: 30)
                                    }
                                    .frame(width: 217, height: 50)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 80)
                }
                .frame(width: 543, height: 342)
                
                HStack {
                    Text("Workout Lavels")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    NavigationLink {
                        WorkoutLavels()
                    } label: {
                        Text("See All")
                            .foregroundStyle(.purple)
                    }
                }
                .frame(width: 322, height: 25)
                .padding(.bottom, 10)
                
                WorkoutLabelSubView()
            }
        }
    }
}

#Preview {
    HomeView()
}
