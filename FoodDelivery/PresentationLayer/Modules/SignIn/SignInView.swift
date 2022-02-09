//
//  SignInView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 25.12.2021.
//

import UIKit
import SnapKit

class SignInView: UIView {

    let backImageView = UIImageView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let emailTextInput = TextInput(icon: R.image.icon_email(), isPassword: false)
    let passwordTextInput = TextInput(icon: R.image.icon_lock(), isPassword: true)
    let continueLabel = UILabel()
    let facebookButton = IconButton(icon: R.image.icon_facebook(), text: R.string.localization.signInButtonFacebook())
    let googleButton = IconButton(icon: R.image.icon_google(), text: R.string.localization.signInButtonGoogle())
    let forgotButton = UIButton(type: .system)
    let loginButton = GreenButton()
    let signUpButton = UIButton(type: .system)
    
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
        addSubview(emailTextInput)
        addSubview(passwordTextInput)
        addSubview(continueLabel)
        addSubview(facebookButton)
        addSubview(googleButton)
        addSubview(forgotButton)
        addSubview(loginButton)
        addSubview(signUpButton)
        
        backImageView.image = R.image.back()
        logoImageView.image = R.image.logo()
        
        titleLabel.text = R.string.localization.signInTitle()
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        emailTextInput.textField.placeholder = R.string.localization.signInEmail()
        emailTextInput.textField.keyboardType = .emailAddress
        passwordTextInput.textField.placeholder = R.string.localization.signInPassword()
        passwordTextInput.textField.isSecureTextEntry = true
        
        continueLabel.text = R.string.localization.signInContinue()
        continueLabel.font = .systemFont(ofSize: 12)
        continueLabel.numberOfLines = 0
        continueLabel.textAlignment = .center
        
        forgotButton.setTitle(R.string.localization.signInButtonForgot(), for: .normal)
        forgotButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        forgotButton.setTitleColor(R.color.green(), for: .normal)
        forgotButton.backgroundColor = UIColor.white

        loginButton.setTitle(R.string.localization.signInButtonLogin(), for: .normal)
        
        signUpButton.setTitle(R.string.localization.signInButtonSignUp(), for: .normal)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        signUpButton.setTitleColor(R.color.green(), for: .normal)
    }
    
    private func setupConstraints() {
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailTextInput.snp.top).offset(-40)
        }
        
        emailTextInput.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(passwordTextInput.snp.top).offset(-12)
            make.left.right.equalToSuperview().inset(25)        }
        
        passwordTextInput.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(continueLabel.snp.top).offset(-20)
            make.left.right.equalToSuperview().inset(25)
            
        }
        
        continueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(forgotButton.snp.top).offset(-97)
            make.width.equalTo(102)
            make.height.equalTo(20)
        }
        
        facebookButton.snp.makeConstraints { make in
            make.bottom.equalTo(forgotButton.snp.top).offset(-20)
            make.left.equalToSuperview().offset(25)
            make.width.equalTo(152)
        }
        
        googleButton.snp.makeConstraints { make in
            make.bottom.equalTo(forgotButton.snp.top).offset(-20)
            make.right.equalToSuperview().offset(-25)
            make.width.equalTo(152)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(loginButton.snp.top).offset(-36)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signUpButton.snp.top).offset(-20)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
}

