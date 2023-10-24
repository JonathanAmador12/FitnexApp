//
//  AgePicker.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 21/09/23.
//

import SwiftUI

struct AgePicker: UIViewControllerRepresentable {
    
    @Binding var selectedValue: String
    
    typealias UIViewControllerType = CustomPikerViewController
    
    func makeUIViewController(context: Context) -> CustomPikerViewController {
        let customPikerVC = CustomPikerViewController()
        customPikerVC.delegate = context.coordinator
        return customPikerVC
    }
    
    func updateUIViewController(_ uiViewController: CustomPikerViewController, context: Context) {
        // update ViewController if is neceasary
    }
    
    // we return a coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NumberSelectionDelegate {
        
        var parent: AgePicker
        
        init(parent: AgePicker) {
            self.parent = parent
        }
        
        func didSelectedAge(age: String) {
            parent.selectedValue = age
            print(age)
        }
    }
    
}

#Preview {
    AgePicker(selectedValue: .constant(""))
        .frame(height: 800)
}
