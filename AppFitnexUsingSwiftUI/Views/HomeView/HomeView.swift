//
//  HomeView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 12/12/23.
//

import SwiftUI

struct HomeView: View {
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
                        ForEach(0...9, id: \.self) {_ in
                            ZStack {
                                Rectangle()
                                    .frame(width: 260, height: 286)
                                VStack {
                                    Spacer()
                                        .frame(height: 180)
                                    VStack(spacing: 3) {
                                        
                                        Text("Full Body Stretching")
                                            .foregroundStyle(.white)
                                            .font(.title)
                                            .frame(width: 217, height: 17)
                                            .minimumScaleFactor(0.8)
                                        
                                        HStack {
                                            HStack(spacing: 5) {
                                                Text("10 minutes")
                                                    .foregroundStyle(.white)
                                                    .font(.subheadline)
                                                Text("|")
                                                    .foregroundStyle(.white)
                                                    .font(.subheadline)
                                                Text("Intermediate")
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
