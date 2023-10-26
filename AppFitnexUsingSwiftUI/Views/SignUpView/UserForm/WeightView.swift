//
//  WeightView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 15/10/23.
//

import SwiftUI

struct WeightView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var selectedWeight: Int = 1
    
    var body: some View {
        VStack {
            // tiitle
            VStack {
                Text("What is your Weight?")
                    .font(.title)
                    .bold()
                    .frame(width: 300, height: 20)
                    .padding(.bottom, 20)
                
                Text("Weight in KG. Don't worry. You can always change it late")
                    .frame(width: 300)
            }
            
            WeightPicker(selectedWeight: $selectedWeight)
                .frame(width: 296, height: 500)
            // Buttons
            HStack(spacing: 16) {
                // button Back
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                })
                // Button continue
                NavigationLink {
                    HeightUserView()
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WeightView(selectedWeight: 1)
}
