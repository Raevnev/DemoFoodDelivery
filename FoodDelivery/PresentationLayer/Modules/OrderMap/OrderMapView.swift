//
//  OrderMapView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 02.02.2022.
//

import Foundation

import UIKit
import SnapKit
import GoogleMaps

class OrderMapView: UIView {

    let backButton = UIButton(type: .system)
    let mapView = GMSMapView()
    
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
     
        addSubview(mapView)
        
        addSubview(backButton)
        
        backButton.setTitle(R.string.localization.orderButtonBack(), for: .normal)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(50)
        }
        
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
