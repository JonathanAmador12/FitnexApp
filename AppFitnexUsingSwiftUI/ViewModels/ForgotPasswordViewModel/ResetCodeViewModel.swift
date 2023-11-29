//
//  ResetCodeViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 15/11/23.
//

import Foundation

class ResetCodeViewModel: ObservableObject {
    
    private var shouldUpdateDigitOne = true
    private var shouldUpdateDigitTwo = true
    private var shouldUpdateDigitThird = true
    private var shouldUpdateDigitFourth = true
    
    @Published var digit1: String = "" {
        willSet {
            if shouldUpdateDigitOne {
                if newValue.count <= 1 {
                    if let newDigit = newValue.last {
                        print("arnol")
                        digit1 = String(newDigit)
                    }
                }
                shouldUpdateDigitOne = false
            } else {
                shouldUpdateDigitOne = false
            }
        }
    }
    @Published var digit2: String = "" {
        willSet {
            if shouldUpdateDigitTwo {
                if newValue.count <= 1 {
                    if let newDigit = newValue.last {
                        digit2 = String(newDigit)
                    }
                }
                shouldUpdateDigitTwo = false
            } else {
                shouldUpdateDigitTwo = false
            }
        }
    }
    
    @Published var digit3: String = "" {
        willSet {
            if shouldUpdateDigitThird {
                if newValue.count <= 1 {
                    if let newValue = newValue.last {
                        digit3 = String(newValue)
                    }
                }
                shouldUpdateDigitThird = false
            } else {
                shouldUpdateDigitThird = false
            }
        }
    }
    
    @Published var digit4: String = "" {
        willSet {
            if shouldUpdateDigitFourth {
                if newValue.count <= 1 {
                    if let newValue = newValue.last {
                        digit4 = String(newValue)
                    }
                }
                shouldUpdateDigitFourth = false
            } else {
                shouldUpdateDigitFourth = false
            }
        }
    }
}
