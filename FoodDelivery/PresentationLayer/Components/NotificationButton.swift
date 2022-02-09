//
//  NotificationButton.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 01.02.2022.
//

import UIKit
import Combine

class NotificationButton: UIButton {
    
    private let notificationImageView = UIImageView()
    
    private var isShowBage = false {
        didSet{
            if isShowBage {
                notificationImageView.image = R.image.icon_NotifiactionRed()
            } else {
                notificationImageView.image = R.image.icon_Notifiaction()
            }
        }
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
        return CGSize(width: 45, height: 45)
    }
   
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 15
        dropShadow(opacity: 0.2, offSet: CGSize(width: 11, height: 28), color: R.color.shadowSecond()!)
        
        addSubview(notificationImageView)
        notificationImageView.image = R.image.icon_NotifiactionRed()
    }
    
    private func setupConstraints() {
        notificationImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(19)
            make.height.equalTo(23)
        }
    }
}
