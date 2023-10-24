//
//  CustomPikerViewController.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 08/10/23.
//

import UIKit

class CustomPikerViewController: UIViewController {
    
    var delegate: NumberSelectionDelegate?
    
    var ageRange: ClosedRange<Int> = 1...70
    
    
    var ages: [String] = []
    
    private var customPiker: UIPickerView = {
        var picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(customPiker)
        
        customPiker.dataSource = self
        customPiker.delegate = self
        
        ages = ageRange.map {"\($0)"}
        
        NSLayoutConstraint.activate([
            customPiker.topAnchor.constraint(equalTo: view.topAnchor),
            customPiker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customPiker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customPiker.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension CustomPikerViewController: UIPickerViewDataSource  {
    // functions of UIPikerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        ages.count
    }
    
}

extension CustomPikerViewController: UIPickerViewDelegate {
    
    // functions of UIPikerViewDelegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedOption = ages[row]
        
        delegate?.didSelectedAge(age: selectedOption)
        // this makes more to quick reload
        pickerView.reloadAllComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        for subview in pickerView.subviews {
            subview.backgroundColor = .clear
        }
        
        let rowHeight: CGFloat = pickerView.rowSize(forComponent: component).height
        // check out if row is right
        let isCurrentRow = row == pickerView.selectedRow(inComponent: component)
        
        if isCurrentRow {
            
            let purpleColor = UIColor.purple
            
            // create a customView with lines up and down
            let customView = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.frame.size.width, height: rowHeight))
            
            // width of lines
            let lineWidth = 50.0
            let lineHeight = 5.0
            
            // purple line above
            let topLine = UIView(frame: CGRect(x: (pickerView.frame.size.width - lineWidth) / 2, y: (rowHeight - lineHeight) / 10, width: lineWidth, height: lineHeight - 2))
            topLine.backgroundColor = purpleColor
            customView.addSubview(topLine)
            
            // purple line down
            let bottomLine = UIView(frame: CGRect(x: (pickerView.frame.size.width - lineWidth) / 2, y: (rowHeight - lineHeight) / 2 + rowHeight / 2, width: lineWidth, height: lineHeight))
            bottomLine.backgroundColor = purpleColor
            customView.addSubview(bottomLine)
            
            // Add a UILabel with that number
            
            let fontSize: CGFloat = 35.0
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = purpleColor
            label.font = UIFont.systemFont(ofSize: fontSize)
            label.text = "\(ages[row])"
            label.frame = CGRect(x: 0, y: 1, width: pickerView.frame.size.width, height: rowHeight - 1)
            customView.addSubview(label)
            
            return customView
            
        } else {
            let selectedValue = pickerView.selectedRow(inComponent: component)
            let currentValue = Int(ages[row])!
            let fontSize: CGFloat = 35.0 - CGFloat(4 * abs(selectedValue - currentValue))
            let color: UIColor = .purple
            let nonSelectedColor: UIColor = .black
            
            let value = "\(ages[row])"
            
            var pickerLabel: UILabel
            
            if let label = view as? UILabel {
                pickerLabel = label
            } else {
                pickerLabel = UILabel()
                pickerLabel.textAlignment = .center
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
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
}
