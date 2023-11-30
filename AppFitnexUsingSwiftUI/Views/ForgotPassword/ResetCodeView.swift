//
//  ResetCodeView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 13/11/23.
//

import SwiftUI

struct ResetCodeView: View {
    enum FormFields: Hashable {
        case d1
        case d2
        case d3
        case d4
    }
    
    @ObservedObject var vm = ResetCodeViewModel()
    @FocusState private var focusField: FormFields?
    
    @State var digitValues: [String]
    @State var oldDigitValues: [String]

    init() {
        digitValues = [" ", " ", " ", " "]
        oldDigitValues = ["", "", "", ""]
    }
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "arrow.backward")
                    })
                    Text("Forgot Password")
                }
                .frame(width: 219, height: 30)
                Spacer()
            }
            .padding(.bottom, 30)
            
            VStack(spacing: 32) {
                Text("Code has been send to + 1111********99")
                
                // SecurityFields
                HStack {
                    
                    ForEach(0..<4, id: \.self) {index in
                        TextField("", text: $digitValues[index], onEditingChanged: { edited in
                            oldDigitValues[index] = digitValues[index]
                        })
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .background(focusField == approachFocusField(index: index) ? .purple.opacity(0.2) : .gray.opacity(0.2))
                            .focused($focusField, equals: approachFocusField(index: index))
                            .onChange(of: digitValues[index]) {newValue in
                                if newValue.count > 1 {
                                    if String(newValue[newValue.startIndex]) == oldDigitValues[index] {
                                        digitValues[index] = String(newValue.suffix(1))
                                    } else {
                                        digitValues[index] = String(newValue.prefix(1))
                                    }
                                }
                                    
                                if !newValue.isEmpty {
                                    moveForwardFocusField(index: index)
                                } else {
                                    moveBackwardFocusField(returnToPreviouField: index)
                                }
                            }
                        
                    }
                    
                }
                .onAppear {
                    focusField = .d1
                }
                
                HStack {
                    Text("Resend codes in")
                    Text("58s")
                }
            }
            .padding(.top, 200)
            
            Spacer()
        }
    }
    
    private func moveForwardFocusField(index: Int) -> Void {
        switch index {
        case 0:
            focusField = .d2
        case 1:
            focusField = .d3
        case 2:
            focusField = .d4
        default:
            focusField = nil
        }
    }
    
    private func moveBackwardFocusField(returnToPreviouField: Int) -> Void {
        switch returnToPreviouField {
        case 3:
            focusField = .d3
        case 2:
            focusField = .d2
        case 1:
            focusField = .d1
        default:
            focusField = nil
        }
    }
    
    private func approachFocusField(index: Int) -> FormFields? {
        switch index {
        case 0:
            return .d1
        case 1:
            return .d2
        case 2:
            return .d3
        case 3:
            return .d4
        default:
            return nil
        }
    }
    
}

#Preview {
    ResetCodeView()
}
