//
//  SecurityFieldPasswords.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 30/08/23.
//

import SwiftUI

struct TextInputToggleView: View {
    
    @Binding var securityField: String
    var title: String
    var isTextField: Bool
    
    var body: some View {
        if isTextField == false {
            SecureField("\(title)", text: $securityField)
        } else {
            TextField("\(title)", text: $securityField)
        }
    }
}

struct SecurityFieldPasswords_Previews: PreviewProvider {
    static var previews: some View {
        TextInputToggleView(securityField: .constant("hola"), title: "", isTextField: false)
    }
}
