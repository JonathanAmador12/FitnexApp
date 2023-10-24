//
//  CustomPickerWeightViewController.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 15/10/23.
//

import UIKit

class CustomPickerWeightViewController: UIViewController {
    
    let weightRange: ClosedRange<Int> = 1...200
    var weights: [Int] = []
    var delegate: WeightSelectionDelegate?
    
    var PickerWeight: UIPickerView = {
        var picker = UIPickerView()
        picker.transform = CGAffineTransform(rotationAngle: .pi/2)
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weights = Array(weightRange)
        
        view.addSubview(PickerWeight)
        
        PickerWeight.dataSource = self
        PickerWeight.delegate = self
        
        NSLayoutConstraint.activate([
            PickerWeight.topAnchor.constraint(equalTo: view.topAnchor),
            PickerWeight.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            PickerWeight.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            PickerWeight.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension CustomPickerWeightViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        weights.count
    }
    
}

extension CustomPickerWeightViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = weights[row]
        delegate?.getSelectedWeight(weight: selectedRow)
        pickerView.reloadAllComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        90
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        for subView in pickerView.subviews {
            subView.backgroundColor = .clear
        }
        
        // isCurrentRow return a bool that tell us if row is iqual to selected row
        let isCurrentRow = row == pickerView.selectedRow(inComponent: component)
        
        
        if isCurrentRow {
            
            let selectedRow = WeightSelectedRow(value: weights[row])
            selectedRow.transform = CGAffineTransform(rotationAngle: -.pi/2)
            return selectedRow
            
        } else {
            let selectedValue = pickerView.selectedRow(inComponent: component)
            let currentValue = weights[row]
            let fontSize: CGFloat = 35.0 - CGFloat(4 * abs(selectedValue - currentValue))
            let color: UIColor = .purple
            let nonSelectedColor: UIColor = .black
            
            let value = "\(weights[row])"
            
            let pickerlabel: UILabel
            
            if let label = view as? UILabel {
                pickerlabel = label
            } else {
                pickerlabel = UILabel()
                pickerlabel.textAlignment = .center
                pickerlabel.textColor = color
                pickerlabel.font = UIFont.systemFont(ofSize: fontSize)
            }
            
            pickerlabel.transform = CGAffineTransform(rotationAngle: -.pi/2)
            
            pickerlabel.text = value
            
            if row == pickerView.selectedRow(inComponent: component) {
                pickerlabel.textColor = color
            } else {
                pickerlabel.textColor = nonSelectedColor
            }
            return pickerlabel
        }
    }
    
}
