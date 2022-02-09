//
//  HomeView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import SnapKit

class HomeView: UIView {

    let logoImageView = UIImageView()
    let logoutButton = UIButton(type: .system)
    let titleLabel = UILabel()
    let notificationButton = NotificationButton()
    let searchTextInput = SearchInput()
    let filterButton = FilterButton()
    let stackView = UIStackView()
    let subTitleLabel = UILabel()
    let menuLabel = MenuItemView()
    let mapButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white

        addSubview(logoImageView)
        addSubview(notificationButton)
        addSubview(searchTextInput)
        addSubview(logoutButton)
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(subTitleLabel)
        addSubview(menuLabel)
        addSubview(mapButton)
        
        logoImageView.image = R.image.pattern_home()
        
        logoutButton.setTitle(R.string.localization.mainButtonLogOut(), for: .normal)
        
        titleLabel.text = R.string.localization.mainTitle()
        titleLabel.font = .boldSystemFont(ofSize: 31)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left

        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(searchTextInput)
        stackView.addArrangedSubview(filterButton)
        
        subTitleLabel.text = R.string.localization.mainSubTitle()
        subTitleLabel.font = .boldSystemFont(ofSize: 15)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textAlignment = .left
        
        mapButton.setTitle(R.string.localization.mainButtonMap(), for: .normal)
        mapButton.setTitleColor(.black, for: .normal)
        mapButton.backgroundColor = R.color.brown()!.withAlphaComponent(0.3)

        mapButton.layer.cornerRadius = 15
        
    }
    
    private func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(31)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(71)
            make.right.equalToSuperview().offset(-39)
            make.size.equalTo(45)
        }
            
        logoutButton.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(35)
        }

        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(25)
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(31)
        }
        
        menuLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(25)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
        }
        
        mapButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(100)
            make.top.equalTo(menuLabel.snp.bottom).offset(20)
        }
    }
}
