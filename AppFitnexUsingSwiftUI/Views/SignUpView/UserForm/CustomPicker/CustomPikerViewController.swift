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
        var piker = UIPickerView()
        piker.translatesAutoresizingMaskIntoConstraints = false
        return piker
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
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        for sv in pickerView.subviews {
            sv.backgroundColor = .clear
        }
        
        let newView = UIView(frame: CGRect(x: 50, y: 0, width: 100, height: 100))
        newView.backgroundColor = .blue
        pickerView.addSubview(newView)
        
        return "Arnol \(ages[row])"
    }
}
