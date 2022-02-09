//
//  MenuItemView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 01.02.2022.
//

import UIKit
import SnapKit
import Combine

class MenuItemView: UIView {

    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let priceLabel = UILabel()
    let stackView = UIStackView()
    
    init() {
        super.init(frame: .zero)

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 87)
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 22
        dropShadow(offSet: .zero, color: R.color.shadow()!)

        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(priceLabel)
        addSubview(stackView)
        
        logoImageView.image = R.image.menu_Photo()

        titleLabel.text = R.string.localization.menuTitle()
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        
        subTitleLabel.text = R.string.localization.menuSubTitle()
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.textColor = .black.withAlphaComponent(0.3)
        subTitleLabel.textAlignment = .left
        
        priceLabel.text = R.string.localization.menuPrice()
        priceLabel.font = .boldSystemFont(ofSize: 22)
        priceLabel.numberOfLines = 0
        priceLabel.textColor = R.color.brown()
        priceLabel.textAlignment = .center
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
    }
    
    private func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.size.equalTo(64)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(logoImageView.snp.right).offset(21)
            make.right.equalTo(priceLabel.snp.left).offset(-16)
        }

        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.size.equalTo(28)
        }
    }
}
