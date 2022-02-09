//
//  GreenButton.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 25.01.2022.
//

import UIKit

class GreenButton: UIButton {
    
    private let gradient = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 175, height: 57)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.frame = bounds
    }
    
    private func setupViews() {
        backgroundColor = .clear
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.colors = [R.color.lightGreen()!.cgColor, R.color.green()!.cgColor]
        layer.addSublayer(gradient)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        setTitleColor(.white, for: .normal)
        setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
        setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .disabled)
        titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
}

