//
//  PasswordTextField.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 01/09/23.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    @State var isFieldVisible: Bool
    
    var sistemNameImage: String
    var title: String
    
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: sistemNameImage)
            TextInputToggleView(securityField: $password, title: title, isTextField: isFieldVisible)
            Button {
                isFieldVisible.toggle()
            } label: {
                if isFieldVisible == false {
                    Image(systemName: "eye.slash.fill")
                } else {
                    Image(systemName: "eye.fill")
                }
            }

        }
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField(password: .constant(""), isFieldVisible: false, sistemNameImage: "test 1", title: "test 1")
    }
}
