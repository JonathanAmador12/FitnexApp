//
//  EmailField.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 03/09/23.
//

import SwiftUI

struct EmailField: View {
    @Binding var email: String
    
    var imageName: String
    var title: String
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: imageName)
            TextField(title, text: $email)
        }
    }
}

struct EmailField_Previews: PreviewProvider {
    static var previews: some View {
        EmailField(email: .constant("test1"), imageName: "house", title: "Email")
    }
}
