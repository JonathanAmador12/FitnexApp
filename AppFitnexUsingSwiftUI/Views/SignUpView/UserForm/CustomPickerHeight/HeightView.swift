//
//  HeightView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 21/10/23.
//

import SwiftUI

struct HeightView: UIViewControllerRepresentable {
    
    @Binding var heightSelected: Int
    
    typealias UIViewControllerType = CustomPickerHeightViewController
    
    func makeUIViewController(context: Context) -> CustomPickerHeightViewController {
        let customPickerHeightViewCoontroller = CustomPickerHeightViewController()
        customPickerHeightViewCoontroller.delegate = context.coordinator
        return customPickerHeightViewCoontroller
    }
    
    func updateUIViewController(_ uiViewController: CustomPickerHeightViewController, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: HeightDelegate {
        
        let parent: HeightView
        
        init(parent: HeightView) {
            self.parent = parent
        }
        
        func getSelectedHeight(height: Int) {
            parent.heightSelected = height
        }
    }
    
}

#Preview {
    HeightView(heightSelected: .constant(0))
}
