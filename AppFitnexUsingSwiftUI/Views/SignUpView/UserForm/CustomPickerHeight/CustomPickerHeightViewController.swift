//
//  CustomPickerHeightViewController.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 20/10/23.
//

import UIKit

class CustomPickerHeightViewController: UIViewController {
    
    let heightRange = 1...300
    var heightsInCentimeters: [Int] = []
    
    var delegate: HeightDelegate?
    
    var heightPicker: UIPickerView = {
        let Picker = UIPickerView()
        Picker.translatesAutoresizingMaskIntoConstraints =  false
        return Picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        heightsInCentimeters =  Array(heightRange)
        
        view.addSubview(heightPicker)
        
        heightPicker.dataSource = self
        heightPicker.delegate = self
        
        NSLayoutConstraint.activate([
            heightPicker.topAnchor.constraint(equalTo: view.topAnchor),
            heightPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            heightPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            heightPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CustomPickerHeightViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        heightsInCentimeters.count
    }
    
}

extension CustomPickerHeightViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = heightsInCentimeters[row]
        delegate?.getSelectedHeight(height: selectedRow)
        pickerView.reloadAllComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        90
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        for subview in pickerView.subviews {
            subview.backgroundColor = .clear
        }
        
        // returns a bool and tell us if row is iqual to selected row
        let isCurrenRow = row == pickerView.selectedRow(inComponent: component)
        
        if isCurrenRow {
            let selectedRow = HeightSelectedView(value: heightsInCentimeters[row])
            return selectedRow
        } else {
            // selectedValue is saved what selectedrow returns, it's saved index of component of pocker
            let selectedValue = pickerView.selectedRow(inComponent: component)
            // current value is saved in constant CurrentValue
            let currentValue = heightsInCentimeters[row]
            // fontSize is usedful to hightlight actual value
            let fontSize: CGFloat = 35.0 - CGFloat(4 * abs(selectedValue - currentValue))
            let color: UIColor = .purple
            let nonSelectedColor: UIColor = .black
            // value is saved of array
            let value = "\(heightsInCentimeters[row])"
            
            let pickerLabel: UILabel
            
            // it's checked if there is a view and it's made a casting to UILabel
            if let label = view as? UILabel {
                pickerLabel = label
            } else {
                // if there's not view so it's created an UILabel and it's assigned to pickerlabel
                pickerLabel = UILabel()
                pickerLabel.textAlignment =  .center
                pickerLabel.textColor = color
                pickerLabel.font = UIFont.systemFont(ofSize: fontSize)
            }
            
            pickerLabel.text = value
            
            if row == pickerView.selectedRow(inComponent: component) {
                pickerLabel.textColor = color
            } else {
                pickerLabel.textColor = nonSelectedColor
            }
            
            return pickerLabel
        }
    }
}
