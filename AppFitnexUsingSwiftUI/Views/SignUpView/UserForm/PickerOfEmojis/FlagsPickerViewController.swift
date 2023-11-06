//
//  FlagsPickerViewController.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 26/10/23.
//

import UIKit

class FlagsPickerViewController: UIViewController {
    
    var flags = ["🏳️‍🌈", "🏳️‍⚧️", "🇺🇳", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇨🇦", "🇧🇷", "🇨🇮", "🇲🇽", "🇰🇷", "🇺🇸", "🇻🇪", "🇬🇧", "🇨🇭", "🇹🇻", "🇯🇵"]
    
    var flagsPicker: UIPickerView {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(flagsPicker)
        
        NSLayoutConstraint.activate([
            flagsPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            flagsPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension FlagsPickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        flags.count
    }
    
    
}

extension FlagsPickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = flags[row]
        pickerView.reloadAllComponents()
    }
}
