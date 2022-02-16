//
//  HomeMenuCell.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 09.02.2022.
//

import UIKit

class HomeMenuCell: UICollectionViewCell {

    static let reuseId = String(describing: self)
    
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let priceLabel = UILabel()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    
        titleLabel.text = nil
        subTitleLabel.text = nil
        priceLabel.text = nil 
    }
    
    func configure(menu: HomeMenu) {
        titleLabel.text = menu.title
        subTitleLabel.text = menu.description
        priceLabel.text = "$\(menu.price)"
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

        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.textColor = .black.withAlphaComponent(0.3)
        
        priceLabel.font = .boldSystemFont(ofSize: 22)
        priceLabel.numberOfLines = 0
        priceLabel.textColor = R.color.brown()
        
        stackView.axis = .vertical
        stackView.backgroundColor = .red
        stackView.spacing = 4
        stackView.distribution = .fill
        stackView.alignment = .leading
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
        }
    }
}
