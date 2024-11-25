//
//  SearchBar.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 27/12/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var disappeartext:Bool
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.leading, 30)
            
            Button(action: {
                disappeartext = false
            }, label: {
                Image(systemName: "x.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                    .bold()
            })
            .padding(.trailing, 30)
        }
        .frame(width: 331, height: 30)
        .background(Color("selectedField"))
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.purple, lineWidth: 2)
        }
    }
}

#Preview {
    SearchBar(text: .constant(""), disappeartext: .constant(false))
}
