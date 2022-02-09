//
//  CoordinatorFactory.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit 

class CoordinatorFactory {
    
    func createMainCoordinator(window: UIWindow) -> MainCoordinator {
        return MainCoordinator(window: window, coordinatorFactory: self, tokenManager: TokenManager.shared)
    }
    
    func createHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator (coordinatorFactory: self, navigationController: navigationController)
    }
}
