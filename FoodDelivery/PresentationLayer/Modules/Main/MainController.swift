//
//  MainController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 05.02.2022.
//

import UIKit
import Combine

class MainController: UITabBarController {
    
    private let tabBarView = MainTabBarView()
    private var cancellableSet = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isHidden = true
        
        view.addSubview(tabBarView)
        
        tabBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
        
        tabBarView.selectedIndex = 0
        
        tabBarView.indexPublisher.sink { [weak self] index in
            self?.selectedIndex = index
        }.store(in: &cancellableSet)
    }
}
