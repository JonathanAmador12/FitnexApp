//
//  Picker2.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 16/09/23.
//

import SwiftUI

struct Picker2: View {
    @State var selectedValue = 10
    var range = 0...100
    @State var items: [Int] = [7,8,9,10,11,12,13]

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                ForEach(items, id: \.self) { number in
                    if number == selectedValue {
                        Text("\(number)")
                            .font(.largeTitle)
                            .gesture(
                                DragGesture()
                                    .onChanged({ s in
                                        print(s)
                                        items = [8,9,10,11,12,13, 14]
                                    })
                                    .onEnded({ s in
                                        print(s)
                                        items = [8,9,10,11,12,13, 14]
                                    })
                            )
                    } else {
                        Text("\(number)")
                            .gesture(
                                DragGesture()
                                    .onChanged({ s in
                                        print(s)
                                        items = [8,9,10,11,12,13, 14]
                                    })
                                    .onEnded({ s in
                                        print(s)
                                        items = [8,9,10,11,12,13, 14]
                                    })
                            )
                    }
                    
                }
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
    }
}

struct Picker2_Previews: PreviewProvider {
    static var previews: some View {
        Picker2()
    }
}
