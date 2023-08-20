//
//  ButtonView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/08/23.
//

import SwiftUI

struct ButtonView: View {
    
    @State var imageName: String
    
    var body: some View {
        Button {
            //
        } label: {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
        }

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(imageName: "google")
    }
}
