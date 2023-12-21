//
//  RemoveBookmark.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 20/12/23.
//

import SwiftUI

struct RemoveBookmark: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Remove From Bookmark?")
                .frame(width: 296, height: 30)
                .font(.title)
                .bold()
                .minimumScaleFactor(0.8)
            
            Rectangle()
                .frame(width: 310, height: 5)
                .foregroundColor(.gray.opacity(0.2))
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 331, height: 150)
                VStack {
                    Spacer().frame(height: 65)
                    HStack {
                        Text("Full Body Stretching")
                            .foregroundStyle(.white)
                            .font(.title2)
                        Spacer()
                    }
                    
                    HStack {
                        HStack(spacing: 10) {
                            Text("6 minutes")
                                .foregroundStyle(.white)
                            Text("|")
                                .foregroundStyle(.white)
                            Text("Intermediate")
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        })
                    }
                }
                .frame(width: 279, height: 19)
            }
            
            HStack(spacing: 20) {
                
                // Button Back
                Button(action: {
                    
                }, label: {
                    Text("Back")
                        .frame(width: 150, height: 50)
                        .foregroundColor(.purple)
                        .background(Color("selectedField"))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 40)
                        )
                })
                
                // button continue
                Button(action: {
                    
                }, label: {
                    Text("Continue")
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 40)
                        )
                })
            }
        }
        .frame(width: 331, height: 275)
    }
}

#Preview {
    RemoveBookmark()
}
