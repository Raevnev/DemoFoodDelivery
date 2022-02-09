//
//  IconButton.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 26.01.2022.
//

import UIKit
import Combine

class IconButton: UIView {
   
    private var tapSubject = PassthroughSubject<Void, Never>()
    
    var tapPublisher: AnyPublisher<Void, Never> {
        tapSubject.eraseToAnyPublisher()
    }
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()

    private var isHighlighted = false {
        didSet { stackView.alpha = isHighlighted ? 0.3 : 1 }
    }
    
    init(icon: UIImage?, text: String) {
        super.init(frame: .zero)
    
        setupViews()
        setupConstraints()
        
        imageView.image = icon
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 57)
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = R.color.lightGray()?.cgColor
        
        addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
    
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
      
        imageView.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        isHighlighted = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isHighlighted = false
        tapSubject.send(())
    }
}

