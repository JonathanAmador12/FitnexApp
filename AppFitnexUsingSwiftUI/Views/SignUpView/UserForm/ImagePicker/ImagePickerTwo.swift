//
//  ImagePicker.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 26/10/23.
//

import SwiftUI

struct ImagePickerTwo: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePickerTwo
        
        init(parent: ImagePickerTwo) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                    if let uiImage = info[.originalImage] as? UIImage {
                        parent.selectedImage = uiImage
                    }
                    parent.presentationMode.wrappedValue.dismiss()
                }
    }

}

#Preview {
    ImagePickerTwo(selectedImage: .constant(nil))
}
