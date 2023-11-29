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
    
    @State var oldDigitOne: String = ""
    @State var oldDigitTwo: String = ""
    @State var oldDigitThree: String = ""
    @State var oldDigitFour: String = ""
    
    @State var digitOne: String = " "
    @State var digitTwo: String = " "
    @State var digitThird: String = " "
    @State var digitFourth: String = " "
    
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
                    
                    TextField("", text: $digitOne, onEditingChanged: { edited in
                        oldDigitOne = digitOne
                    })
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 50, height: 50)
                        .background(focusField == .d1 ? .purple.opacity(0.2) : .gray.opacity(0.2))
                        .focused($focusField, equals: .d1)
                        .onChange(of: digitOne) { newValue in
                            if newValue.count > 1 {
                                // eliminar el valor anterior
                                if String(newValue[newValue.startIndex])  == oldDigitOne {
                                    // "21"
                                    digitOne = String(newValue[newValue.index(before: newValue.endIndex)])
                                } else {
                                    digitOne = String(newValue[newValue.startIndex])
                                }
                            }
                            
                            if !newValue.isEmpty {
                                moveForwardFocusField(currentField: .d1)
                            }else {
                                moveBackwardFocusField(returnToPreviouField: .d1)
                            }
                            
                        }
                    
                    TextField("", text: $digitTwo, onEditingChanged: { edited in
                        oldDigitTwo = digitTwo
                    })
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 50, height: 50)
                        .background(focusField == .d2 ? .purple.opacity(0.2) : .gray.opacity(0.2))
                        .focused($focusField, equals: .d2)
                        .onChange(of: digitTwo) { newValue in
                            if newValue.count > 1 {
                                // eliminar el valor anterior
                                if String(newValue[newValue.startIndex])  == oldDigitTwo {
                                    digitTwo = String(newValue[newValue.index(before: newValue.endIndex)])
                                } else {
                                    digitTwo = String(newValue[newValue.startIndex])
                                }
                            }
                            
                            if !newValue.isEmpty {
                                moveForwardFocusField(currentField: .d2)
                            } else {
                                moveBackwardFocusField(returnToPreviouField: .d2)
                            }
                        }
                    
                    TextField("", text: $digitThird, onEditingChanged: { edited in
                        oldDigitThree = digitThird
                    })
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 50, height: 50)
                        .background(focusField == .d3 ? .purple.opacity(0.2) : .gray.opacity(0.2))
                        .focused($focusField, equals: .d3)
                        .onChange(of: digitThird) { newValue in
                            if newValue.count > 1 {
                                // eliminar el valor anterior
                                if String(newValue[newValue.startIndex])  == oldDigitThree {
                                    // "21"
                                    digitThird = String(newValue[newValue.index(before: newValue.endIndex)])
                                } else {
                                    digitThird = String(newValue[newValue.startIndex])
                                }
                            }
                            
                            if !newValue.isEmpty {
                                moveForwardFocusField(currentField: .d3)
                            }else {
                                moveBackwardFocusField(returnToPreviouField: .d3)
                            }
                        }
                    
                    TextField("", text: $digitFourth, onEditingChanged: { edited in
                        oldDigitFour = digitFourth
                    })
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 50, height: 50)
                        .background(focusField == .d4 ? .purple.opacity(0.2) : .gray.opacity(0.2))
                        .focused($focusField, equals: .d4)
                        .onChange(of: digitFourth) {newValue in
                            if newValue.count > 1 {
                                if String(newValue[newValue.startIndex]) == oldDigitFour {
                                    digitFourth = String(newValue[newValue.index(before: newValue.endIndex)])
                                } else {
                                    digitFourth = String(newValue[newValue.startIndex])
                                }
                            }
                            
                            if !newValue.isEmpty {
                                moveForwardFocusField(currentField: .d4)
                            } else {
                                moveBackwardFocusField(returnToPreviouField: .d4)
                            }
                        }
                    
//                    ForEach(0..<4, id: \.self) {index in
//                        DigitTextField(ditit: binding(index: index))
//                            .background(focusColorField == index ? .purple.opacity(0.2) : .gray.opacity(0.2))
//                            .focused($focusField, equals: indexToFocusField(index: index))
//                            .focused($focusColorField, equals: index)
//                            .onChange(of: indexToVariable(index: index)) { _ in
//                                moveToNextField(index: index)
//                            }
//                    }
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
    
    private func moveForwardFocusField(currentField: FormFields) -> Void {
        switch currentField {
        case .d1:
            focusField = .d2
        case .d2:
            focusField = .d3
        case .d3:
            focusField = .d4
        default:
            focusField = nil
        }
    }
    
    private func moveBackwardFocusField(returnToPreviouField: FormFields) -> Void {
        switch returnToPreviouField {
        case .d4:
            focusField = .d3
        case .d3:
            focusField = .d2
        case .d2:
            focusField = .d1
        default:
            focusField = nil
        }
    }
}

#Preview {
    ResetCodeView()
}
