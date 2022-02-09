//
//  MainTabBarView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 05.02.2022.
//

import UIKit
import SnapKit
import Combine

class MainTabBarView: UIView {

    private var indexSubject = PassthroughSubject<Int, Never>()
    
    var indexPublisher: AnyPublisher<Int, Never> {
        indexSubject.eraseToAnyPublisher()
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            homeItem.isSelected = selectedIndex == 0
            privateItem.isSelected = selectedIndex == 1
            cartItem.isSelected = selectedIndex == 2
            chatItem.isSelected = selectedIndex == 3
            
            indexSubject.send(selectedIndex)
        }
    }
    
    private let stackView = UIStackView()
    private let homeItem = MainTabBarItemView(icon: UIImage(named: "tab_home")!, text: "Home")
    private let privateItem = MainTabBarItemView(icon: UIImage(named: "icon_username")!, text: "Private")
    private let cartItem = MainTabBarItemView(icon: UIImage(named: "tab_cart")!, text: "Cart")
    private let chatItem = MainTabBarItemView(icon: UIImage(named: "tab_chat")!, text: "Chat")
    
    private var cancellableSet = Set<AnyCancellable>()

    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 22
        
        dropShadow(opacity: 0.1, offSet: .zero, color: UIColor(named: "Shadow")!)

        addSubview(stackView)
    
        stackView.addArrangedSubview(homeItem)
        stackView.addArrangedSubview(privateItem)
        stackView.addArrangedSubview(cartItem)
        stackView.addArrangedSubview(chatItem)
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
    }
    
    private func setupConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(15)
        }
    }
    
    private func setupBindings() {
        homeItem.tapPublisher.sink { [weak self] _ in
            self?.selectedIndex = 0
        }.store(in: &cancellableSet)
        
        privateItem.tapPublisher.sink { [weak self] _ in
            self?.selectedIndex = 1
        }.store(in: &cancellableSet)
        
        cartItem.tapPublisher.sink { [weak self] _ in
            self?.selectedIndex = 2
        }.store(in: &cancellableSet)
        
        chatItem.tapPublisher.sink { [weak self] _ in
            self?.selectedIndex = 3
        }.store(in: &cancellableSet)
    }
}
