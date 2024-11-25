//
//  MyBookMarkView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/12/23.
//

import SwiftUI

struct MyBookMarkView: View {
    
    var imagenes:[HomeViewPictures] = [
        HomeViewPictures(id: 1, image: "twoImage", title: "Arms Dumbbel", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 2, image: "gymOne", title: "Arms Dumbbel", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 3, image: "gymThree", title: "Arms Dumbbel", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 4, image: "gymFive", title: "Arms Dumbbel", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 5, image: "gymNine", title: "Arms Dumbbel", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 6, image: "gymTen", title: "Arms Dumbbel", time: "10 minutes", level: "Intermediate"),
        HomeViewPictures(id: 7, image: "gymEleven", title: "Arms Dumbbel", time: "10 minutes", level: "Intermediate")
    ]
    
    @Environment(\.presentationMode) var presentationMode
    
    // number of columns of grid
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @State var isActiveRemoveBookmark: Bool = false
    
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
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWidth(.standard)
                    })
                    
                    Text("My Bookmark")
                        .font(.title)
                        .fontWidth(.standard)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "doc.plaintext")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "squareshape.split.2x2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.purple)
                            .foregroundColor(.black)
                    })
                    
                }
            }
            .frame(width: 331, height: 30)
            .padding(.bottom, 40)
            TrainingLevelView()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach( imagenes) {
                        image in
                        ZStack {
                            Image(image.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 156, height: 135)
                                .cornerRadius(10)
                            VStack {
                                Spacer()
                                    .frame(height: 60)
                                Text(image.title)
                                    .frame(width: 130, height: 17)
                                    .foregroundStyle(.white)
                                    .padding(.trailing)
                                HStack {
                                    HStack(spacing: 3) {
                                        Text(image.time)
                                            .foregroundStyle(.white)
                                            .minimumScaleFactor(0.1)
                                        Text("|")
                                            .foregroundStyle(.white)
                                            .minimumScaleFactor(0.1)
                                        Text(image.level)
                                            .foregroundStyle(.white)
                                            .minimumScaleFactor(0.1)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        isActiveRemoveBookmark = true
                                    }, label: {
                                        Image(systemName: "bookmark.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:9, height: 12)
                                            .foregroundColor(.white)
                                    })
                                    .sheet(isPresented: $isActiveRemoveBookmark, content: {
                                        RemoveBookmark()
                                            .presentationDetents([.height(336)])
                                            .interactiveDismissDisabled()
                                    })
                                    
                                }
                                .frame(width: 132, height: 12)
                            }
                        }
                    }
                }
                .frame(width: 331, height: 588)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MyBookMarkView()
}
