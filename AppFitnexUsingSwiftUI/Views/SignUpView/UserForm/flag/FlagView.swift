//
//  flagView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 29/10/23.
//

import SwiftUI
import Combine

struct FlagView: View {
    
    @ObservedObject var flagViewModel = FlagViewModel()
    @State var searchQuery: String
    @Binding var isSheetPresent: Bool
    @Binding var selectedFlag: Flag
    
    var subcription = Set<AnyCancellable>()
    var flagsTwo: [Flag] = []
    
    var body: some View {
        VStack {
            HStack(spacing: 50) {
                Button(action: {
                    isSheetPresent = false
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.purple)
                })
                Text("Select your Country")
                    .fontWeight(.bold)
                Button(action: {
                    isSheetPresent = false
                }, label: {
                    Text("Done")
                        .foregroundStyle(.purple)
                })
            }
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
                TextField("Search for country", text: $searchQuery)
                Button(action: {
                  searchQuery = ""
                }, label: {
                    Text("\(Image(systemName: "x.circle.fill"))       ")
                        .foregroundStyle(.black)
                })
            }
            .frame(height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)
            )
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Text("Selected")
                .padding(.trailing, 280)
            HStack {
                HStack(spacing: 20) {
                    Text("\(flagViewModel.selectedFlagPublisher.imageFlag)")
                    Text("\(flagViewModel.selectedFlagPublisher.nameFlag)")
                }
                Spacer()
                Text("(+\(flagViewModel.selectedFlagPublisher.ladaNumber)")
            }
            .frame(width: 350)
            Text("Countries")
                .padding(.trailing, 280)
            ScrollView {
                ForEach(flagViewModel.flagsPublisher, id: \.self) { flag in
                    HStack {
                        HStack(spacing: 20){
                            Text("\(flag.imageFlag)")
                            Text("\(flag.nameFlag)")
                        }
                        Spacer()
                        Text("(+\(flag.ladaNumber))")
                    }
                    .frame(width: 350)
                    .onTapGesture {
                        flagViewModel.selectedFlagPublisher = flag
                        selectedFlag = flag
                    }
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray.opacity(0.1))
                }
            }
        }
//        .onAppear {
//            flagViewModel.setFlag(word: searchQuery)
//        }
        .onChange(of: searchQuery, perform: { value in
            flagViewModel.setFlag(word: value)
        })
    }
}

#Preview {
    FlagView(searchQuery: "", isSheetPresent: .constant(false), selectedFlag: .constant(Flag(nameFlag: "", imageFlag: "", ladaNumber: 0)))
}
