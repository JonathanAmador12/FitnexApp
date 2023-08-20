//
//  CheckSquare.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 18/08/23.
//

import SwiftUI

struct CheckSquare: View {
    
    @State private var isChecked: Bool = false
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            Text("")
        }
    }
}

struct CheckSquare_Previews: PreviewProvider {
    static var previews: some View {
        CheckSquare()
    }
}
