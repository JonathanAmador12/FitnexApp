//
//  DigitTextField.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 17/11/23.
//

import SwiftUI

struct DigitTextField: View {
    
    @Binding var ditit: String
    
    var body: some View {
        TextField("", text: $ditit)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .frame(width: 50, height: 50)
            
    }
}

#Preview {
    DigitTextField(ditit: .constant(""))
}
