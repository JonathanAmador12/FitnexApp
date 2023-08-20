//
//  CheckBoxStyle.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 17/08/23.
//

import Foundation
import SwiftUI

class CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                . foregroundColor(configuration.isOn ? Color.purple : Color.primary)
        }

    }
}
