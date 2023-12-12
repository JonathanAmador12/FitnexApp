//
//  backgroundGrey.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 08/12/23.
//

import SwiftUI

struct backgroundGrey: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.gray.opacity(0.2))
            .ignoresSafeArea()
    }
}

#Preview {
    backgroundGrey()
}
