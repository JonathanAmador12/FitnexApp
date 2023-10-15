//
//  AgeView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 13/09/23.
//

import SwiftUI

struct AgeView: View {
    
    @State private var selectedIdx: String = ""
    
    let range = 1...80
    
    var body: some View {
        VStack {
            
            // Title
            VStack {
                Text("How old are you?")
                    .font(.title)
                    .bold()
                    .frame(width: 300, height: 20)
                    .padding(.bottom, 50)
                
                // description
                Text("age in years. This will hep us to personalize an excercise program plant that suits you")
                    .frame(width: 300)
            }
            
            // piker
            AgePicker(selectedValue: $selectedIdx)
            .frame(width: 100, height: 500)
            
            // buttons
            HStack(spacing: 16) {
                // button of return
                Button {
                    //
                } label: {
                    Text("Back")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                // button of continue
                Button {
                    //
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }

            }
        }

    }
    
    

}

struct AgeView_Previews: PreviewProvider {
    static var previews: some View {
        AgeView()
    }
}









//struct PickerView: UIViewRepresentable {
//    var data: [[String]]
//    @Binding var selections: Int
//
//    // Assign custom coordinator for delegate functions.
//    func makeCoordinator() -> PickerView.Coordinator {
//        Coordinator(self)
//    }
//
//    // Creates the view object and configures its initial state.
//    func makeUIView(context: UIViewRepresentableContext<PickerView>) -> UIPickerView {
//        let picker = UIPickerView(frame: .zero)
//
//        picker.dataSource = context.coordinator
//        picker.delegate = context.coordinator
//
//        return picker
//    }
//
//    // Updates the state of the specified view with new information from SwiftUI.
//    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<PickerView>) {
//        // for i in 0...(self.selections.count - 1) {
//        //     view.selectRow(self.selections[i], inComponent: i, animated: false)
//        // }
//    }
//
//
//    // Coordinator acting as the delegate in SwiftUI.
//    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
//        var parent: PickerView
//
//        //init(_:)
//        init(_ pickerView: PickerView) {
//            self.parent = pickerView
//        }
//        
//        // Set your custom row height here!
//        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//            return 200
//        }
//
//        //numberOfComponents(in:)
//        func numberOfComponents(in pickerView: UIPickerView) -> Int {
//            return self.parent.data.count
//        }
//
//        //pickerView(_:numberOfRowsInComponent:)
//        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//            return self.parent.data[component].count
//        }
//
//        //pickerView(_:titleForRow:forComponent:)
//        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//            return self.parent.data[component][row]
//        }
//
//        //pickerView(_:didSelectRow:inComponent:)
//        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            // self.parent.selections[component] = row
//        }
//    }
//}
