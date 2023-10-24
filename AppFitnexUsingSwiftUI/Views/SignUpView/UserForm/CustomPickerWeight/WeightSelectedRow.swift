//
//  WeightSelectedRow.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 19/10/23.
//

import UIKit

class WeightSelectedRow: UIView {
    private var value: Int?

    private var topTringle: UIView = {
        // triangle properties
        let triangleWidth: CGFloat = 25
        let triangleHeight: CGFloat = 18.58
        let triangleColor: UIColor = .purple
        
        let triangleView = UIView()
        //triangleView.backgroundColor = .clear

        let triangleLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: triangleHeight))
        path.addLine(to: CGPoint(x: triangleWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: triangleWidth, y: triangleHeight))
        path.close()

        triangleLayer.path = path.cgPath
        triangleLayer.fillColor = triangleColor.cgColor
        triangleView.layer.addSublayer(triangleLayer)
        triangleView.transform = CGAffineTransform(rotationAngle: .pi * 1.0)
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        return triangleView
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
    
    private var bottomTringle: UIView = {
        // triangle properties
        let triangleWidth: CGFloat = 25
        let triangleHeight: CGFloat = 18.58
        let triangleColor: UIColor = .purple
        
        let triangleView = UIView()
        //triangleView.backgroundColor = .clear

        let triangleLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: triangleHeight))
        path.addLine(to: CGPoint(x: triangleWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: triangleWidth, y: triangleHeight))
        path.close()

        triangleLayer.path = path.cgPath
        triangleLayer.fillColor = triangleColor.cgColor

        triangleView.layer.addSublayer(triangleLayer)
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        return triangleView
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
        addSubview(topTringle)
        addSubview(numberLabel)
        addSubview(bottomTringle)
    }
    
    func configureConstrains() {
        NSLayoutConstraint.activate([
            // top tringle
            topTringle.bottomAnchor.constraint(equalTo: numberLabel.topAnchor, constant: -20),
            topTringle.widthAnchor.constraint(equalToConstant: 25),
            topTringle.heightAnchor.constraint(equalToConstant: 18.58),
            topTringle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // label
            numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: 50),
            numberLabel.heightAnchor.constraint(equalToConstant: 50),
            numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // bottom tringle
            bottomTringle.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 20),
            bottomTringle.widthAnchor.constraint(equalToConstant: 25),
            bottomTringle.heightAnchor.constraint(equalToConstant: 18.58),
            bottomTringle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
