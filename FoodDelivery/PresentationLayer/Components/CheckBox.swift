//
//  CheckBox.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 01.02.2022.
//

import UIKit
import Combine

class CheckBox: UIView {
   
    private var checkedSubject = PassthroughSubject<Bool, Never>()
    
    var checkedPublisher: AnyPublisher<Bool, Never> {
        checkedSubject.eraseToAnyPublisher()
    }
    
    private let button = UIButton()
    private let label = UILabel()
    
    private var isChecked = false
    
    private var cancellableSet = Set<AnyCancellable>()
    
    init(text: String) {
        super.init(frame: .zero)
    
        setupViews()
        setupConstraints()
        setupBindings()
        
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .clear
        
        addSubview(button)
        addSubview(label)
    
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        
        button.setImage(R.image.check_box_off(), for: .normal)
    }
    
    private func setupConstraints() {
        button.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.size.equalTo(22)
        }
      
        label.snp.makeConstraints { make in
            make.left.equalTo(button.snp.right).offset(8)
            make.top.right.bottom.equalToSuperview()
        }
        
        snp.makeConstraints { make in
//            make.height.equalTo(22).priority(999)
            make.height.greaterThanOrEqualTo(22).priority(999)    // больше либо равно 22
//            make.height.lessThanOrEqualTo(22).priority(999)     // меньше либо равно 22
        }
    }
    
    private func setupBindings() {
        button.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            
            self.isChecked.toggle()
            self.checkedSubject.send(self.isChecked)
            
            if self.isChecked {
                self.button.setImage(R.image.check_box_on(), for: .normal)
            } else {
                self.button.setImage(R.image.check_box_off(), for: .normal)
            }
        }.store(in: &cancellableSet)
    }
}
