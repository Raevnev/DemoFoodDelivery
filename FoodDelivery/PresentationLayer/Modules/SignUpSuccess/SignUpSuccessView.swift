//
//  SignUpSuccessView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import SnapKit

class SignUpSuccessView: UIView {

    let backImageView = UIImageView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let tryOrderButton = GreenButton()
    
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
        addSubview(backImageView)
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(tryOrderButton)
        
        backImageView.image = R.image.pattern_Back()
        logoImageView.image = R.image.illustration()
        
        titleLabel.text = R.string.localization.signUpSucTitle()
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = R.color.green()
        titleLabel.textAlignment = .center
        
        descriptionLabel.text = R.string.localization.signUpSucDescripTitle()
        descriptionLabel.font = .boldSystemFont(ofSize: 23)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = R.color.text_black()
        descriptionLabel.textAlignment = .center
        
        tryOrderButton.setTitle(R.string.localization.signUpSucButtonNext(), for: .normal)
    }
    
    private func setupConstraints() {
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-33)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-12)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(tryOrderButton.snp.top).offset(-192)
        }
        
        tryOrderButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
    }
}
