//
//  MainTabBarItemView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 05.02.2022.
//

import UIKit
import SnapKit
import Combine

class MainTabBarItemView: UIView {

    private var tapSubject = PassthroughSubject<Void, Never>()
    
    var tapPublisher: AnyPublisher<Void, Never> {
        tapSubject.eraseToAnyPublisher()
    }
    
    var isSelected: Bool = false {
        didSet {
            backgroundColor = isSelected ? UIColor(named: "Green")?.withAlphaComponent(0.1) : .clear
            label.isHidden = !isSelected
        }
    }
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()
    
    init(icon: UIImage, text: String) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        
        imageView.image = icon
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor(named: "Green")?.withAlphaComponent(0.1)
        layer.cornerRadius = 12

        addSubview(stackView)
    
        label.textColor = UIColor(named: "Text_black")
        label.font = .boldSystemFont(ofSize: 12)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
   
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(17)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        tapSubject.send(())
    }
}
