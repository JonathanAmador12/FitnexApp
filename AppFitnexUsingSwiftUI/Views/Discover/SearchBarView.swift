//
//  SearchBarView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/11/24.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var discoverViewModel = DiscoverViewModel()

    var body: some View {
        
        if discoverViewModel.isSearchBarActive == true {
            SearchBar(text: $discoverViewModel.searchText, disappeartext: $discoverViewModel.isSearchBarActive)
                .padding(.bottom, 10)
        } else {
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
                Button(action: {}, label: {
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)

                })
            }
            .frame(width: 331, height: 25)
            .padding(.bottom, 10)
        }
        
        TrainingLevelView()
        
        
        if discoverViewModel.isSearchBarActive == true {
            List(discoverViewModel.filteredItems) {
                item in
                VStack {
                    Text(item.title)
                }
            }
            
        } else {
            ScrollView {
                
                GeometryReader { proxy in
                    Color.clear
                        .onChange(of: proxy.frame(in: .global).minY) {
                            newOffset in
                            discoverViewModel.detectScrollDirection(newOffset: newOffset)
                        }
                }
                .frame(height: 0)
        
                ForEach(discoverViewModel.imagesPublisher) {
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
}

#Preview {
    SearchBarView()
}
