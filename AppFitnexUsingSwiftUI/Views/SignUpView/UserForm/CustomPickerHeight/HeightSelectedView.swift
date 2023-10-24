//
//  HeightSelectedView.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 22/10/23.
//

import UIKit

class HeightSelectedView: UIView {
    
    var value: Int?
    
    private var lineTop: UIView = {        
        let lineView = UIView()
        lineView.backgroundColor = .purple
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        
        var labelText = ""
        
        if let value = value {
            labelText = "\(value)"
        }
        
        label.text = labelText
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40.0)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private var bottomLine: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = .purple
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    init(value: Int) {
        super.init(frame: .zero)
        self.value = value
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addViews()
        configureConstrains()
    }
    
    func addViews() {
        addSubview(lineTop)
        addSubview(bottomLine)
        addSubview(numberLabel)
    }
    
    func configureConstrains() {
        NSLayoutConstraint.activate([
            lineTop.topAnchor.constraint(equalTo: self.topAnchor),
            lineTop.widthAnchor.constraint(equalToConstant: 50),
            lineTop.heightAnchor.constraint(equalToConstant: 5),
            lineTop.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            bottomLine.topAnchor.constraint(equalTo: numberLabel.bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 5),
            bottomLine.widthAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
