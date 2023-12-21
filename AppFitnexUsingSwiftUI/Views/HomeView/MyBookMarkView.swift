//
//  MyBookMarkView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/12/23.
//

import SwiftUI

struct MyBookMarkView: View {
    
    // number of columns of grid
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .font(.title)
                    .fontWidth(.standard)
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
                ForEach( 0..<20, id: \.self) {
                    _ in
                    ZStack {
                        Rectangle()
                            .frame(width: 156, height: 135)
                        .cornerRadius(10)
                        VStack {
                            Spacer()
                                .frame(height: 60)
                            Text("Arms Dumbbel")
                                .frame(width: 130, height: 17)
                                .foregroundStyle(.white)
                                .padding(.trailing)
                            HStack {
                                HStack(spacing: 3) {
                                    Text("10 minutes")
                                        .foregroundStyle(.white)
                                        .minimumScaleFactor(0.1)
                                    Text("|")
                                        .foregroundStyle(.white)
                                        .minimumScaleFactor(0.1)
                                    Text("Intermediate")
                                        .foregroundStyle(.white)
                                        .minimumScaleFactor(0.1)
                                }
                                Spacer()
                                Button(action: {
                                    //
                                }, label: {
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:9, height: 12)
                                        .foregroundColor(.white)
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
}

#Preview {
    MyBookMarkView()
}
