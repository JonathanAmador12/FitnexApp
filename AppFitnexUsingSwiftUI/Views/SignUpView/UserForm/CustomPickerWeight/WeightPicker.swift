//
//  WeightPicker.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 17/10/23.
//

import SwiftUI

struct WeightPicker: UIViewControllerRepresentable {
    
    @Binding var selectedWeight: Int
    
    typealias UIViewControllerType = CustomPickerWeightViewController
    
    func makeUIViewController(context: Context) -> CustomPickerWeightViewController {
        
        let customPickerWeightViewController = CustomPickerWeightViewController()
        customPickerWeightViewController.delegate = context.coordinator
        return customPickerWeightViewController
        
    }
    
    func updateUIViewController(_ uiViewController: CustomPickerWeightViewController, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: WeightSelectionDelegate {
        
        var parent: WeightPicker
        
        init(parent: WeightPicker) {
            self.parent = parent
        }
        
        func getSelectedWeight(weight: Int) {
            parent.selectedWeight = weight
            print("\(weight)")
        }
    }
    
}

#Preview {
    WeightPicker(selectedWeight: .constant(1))
}
