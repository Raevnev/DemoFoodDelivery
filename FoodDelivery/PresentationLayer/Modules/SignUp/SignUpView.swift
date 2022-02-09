//
//  SignUpView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 18.01.2022.
//

import UIKit
import SnapKit

class SignUpView: UIView {
   
    let backImageView = UIImageView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let userNameTextInput = TextInput(icon: R.image.icon_username(), isPassword: false)
    let emailTextInput = TextInput(icon: R.image.icon_email(), isPassword: false)
    let passwordTextInput = TextInput(icon: R.image.icon_lock(), isPassword: true)
    let keepMeCheckBox = CheckBox(text: R.string.localization.signUpKeepMe())
    let emailMeCheckBox = CheckBox(text: R.string.localization.signUpEmailMe())
    let createButton = GreenButton()
    let alreadyButton = UIButton()
    
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
        addSubview(userNameTextInput)
        addSubview(emailTextInput)
        addSubview(passwordTextInput)
        addSubview(keepMeCheckBox)
        addSubview(emailMeCheckBox)
        addSubview(createButton)
        addSubview(alreadyButton)

        backImageView.image = R.image.back()
        logoImageView.image = R.image.logo()
        
        titleLabel.text = R.string.localization.signUpTitle()
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        emailTextInput.textField.placeholder = R.string.localization.signUpEmail()
        passwordTextInput.textField.placeholder = R.string.localization.signUpPassword()
        
        createButton.setTitle(R.string.localization.signUpButtonCreate(), for: .normal)
        
        alreadyButton.setTitle(R.string.localization.signUpButtonAlready(), for: .normal)
        alreadyButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        alreadyButton.setTitleColor(R.color.green(), for: .normal)
    }
    
    private func setupConstraints() {
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-65)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(userNameTextInput.snp.top).offset(-40)
        }
        
        userNameTextInput.snp.makeConstraints { make in
            make.bottom.equalTo(emailTextInput.snp.top).offset(-12)
            make.left.right.equalToSuperview().inset(25)
        }
        
        emailTextInput.snp.makeConstraints { make in
            make.bottom.equalTo(passwordTextInput.snp.top).offset(-12)
            make.left.right.equalToSuperview().inset(25)
        }
        
        passwordTextInput.snp.makeConstraints { make in
            make.bottom.equalTo(keepMeCheckBox.snp.top).offset(-16)
            make.left.right.equalToSuperview().inset(25)
        }
        
        keepMeCheckBox.snp.makeConstraints { make in
            make.bottom.equalTo(emailMeCheckBox.snp.top).offset(-8)
            make.left.right.equalToSuperview().inset(25)
        }
        
        emailMeCheckBox.snp.makeConstraints { make in
            make.bottom.equalTo(createButton.snp.top).offset(-48)
            make.left.right.equalToSuperview().inset(25)
        }
        
        createButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(alreadyButton.snp.top).offset(-20)
        }
        
        alreadyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
}
