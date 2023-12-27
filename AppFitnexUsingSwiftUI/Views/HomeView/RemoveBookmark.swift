//
//  RemoveBookmark.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 20/12/23.
//

import SwiftUI

struct RemoveBookmark: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
                // TODO: Change the rect for an image.
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 331, height: 150)

                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 65)
                    Text("Full Body Stretching")
                        .foregroundStyle(.white)
                        .font(.title2)

                    HStack {
                        Text("6 minutes")
                        Text("|")
                        Text("Intermediate")
                        Spacer()
                        Button(action: {
                            // TODO: define if it should be a button or not.
                        }, label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    }
                    
                }
                .foregroundStyle(.white)
                .frame(width: 279, height: 19)
            }
            
            HStack(spacing: 20) {
                // Button Back
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
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
                    //
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
        .frame(width: 395, height: 336)
        
    }
}

#Preview {
    RemoveBookmark()
}
