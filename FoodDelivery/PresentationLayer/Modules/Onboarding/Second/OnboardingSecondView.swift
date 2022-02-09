//
//  OnboardingSecondView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import SnapKit

class OnboardingSecondView: UIView {

    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let nextButton = GreenButton()
    
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
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(nextButton)

        logoImageView.image = R.image.onboarding_logo_2()
        
        titleLabel.text = R.string.localization.onsecondTitle()
        titleLabel.font = .systemFont(ofSize: 22)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        subtitleLabel.text = R.string.localization.onsecondSubtitle()
        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        nextButton.setTitle(R.string.localization.onsecondButtonNext(), for: .normal)
    }
    
    private func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(46)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-59)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-20)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-42)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
    }
}
