//
//  SearchInput.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 31.01.2022.
//

import UIKit

class SearchInput: UIView {
    
    let textField = UITextField()
    let searchImageView = UIImageView()
        
    init() {
        super.init(frame: .zero)
    
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50)
    }
    
    private func setupViews() {
        
        backgroundColor = R.color.brown_light()?.withAlphaComponent(0.1)
        
        layer.cornerRadius = 15
        
        searchImageView.image = R.image.iconSearch()
        
        addSubview(textField)
        addSubview(searchImageView)
        
        textField.textColor = R.color.brown_dark()?.withAlphaComponent(0.4)
        textField.font = .systemFont(ofSize: 12)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = R.string.localization.searchText()
        
    }
    
    private func setupConstraints() {
        
        searchImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.size.equalTo(24)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(searchImageView.snp.right).offset(19)
            make.right.equalToSuperview().offset(-47)
        }
        
    }
}
