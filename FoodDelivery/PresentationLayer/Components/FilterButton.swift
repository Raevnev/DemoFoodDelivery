//
//  FilterButton.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 31.01.2022.
//

import UIKit

class FilterButton: UIButton {
    
    private let filterImageView = UIImageView()
    
    override var isHighlighted: Bool {
        didSet { alpha = isHighlighted ? 0.3 : 1 }
    }
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50, height: 50)
    }
   
    private func setupViews() {
        backgroundColor = R.color.brown()?.withAlphaComponent(0.1)
        layer.cornerRadius = 15
        
        addSubview(filterImageView)
        filterImageView.image = R.image.filter_Icon()
    }
    
    private func setupConstraints() {
        filterImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(24)
        }
    }
}
