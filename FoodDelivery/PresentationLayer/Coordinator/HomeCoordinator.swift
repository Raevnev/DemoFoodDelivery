//
//  HomeCoordinator.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 05.02.2022.
//

import Foundation
import UIKit
import Combine
import Moya

class HomeCoordinator: BaseCoordinator<Void> {
        
    private let coordinatorFactory: CoordinatorFactory
    private var navigationController: UINavigationController

    init(coordinatorFactory: CoordinatorFactory, navigationController: UINavigationController) {
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = navigationController
        super.init()
    }
    
    override func start() -> AnyPublisher<Void, Never> {
        return Deferred<AnyPublisher<Void, Never>> { [weak self] in
            guard let self = self else { return Empty<Void, Never>(completeImmediately: false).eraseToAnyPublisher()}
            
            self.showStartScreen()
            
            return Empty(completeImmediately: false).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
    private func showStartScreen() {
        let provider = MoyaProvider<ShopTarget>(plugins: [])
        let shopService: ShopService = ShopServiceImpl(provider: provider)

        let viewModel = HomeViewModel(shopService: shopService)
        let viewController = HomeViewController(viewModel: viewModel)
        
//        viewModel.logoutEvent
//            .handleEvents(receiveOutput: { [weak self] _ in
//                self?.tokenManager.removeToken()
//            })
//            .subscribe(flowCompleted)
//            .store(in: &cancellables)
      
        viewModel.mapEvent.sink { [weak self] _ in
            self?.showOrderMap()
        }.store(in: &cancellables)
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func showOrderMap() {
        let viewModel = OrderMapViewModel()
        let viewController = OrderMapViewController(viewModel: viewModel)
        
        viewModel.backEvent.sink { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }.store(in: &cancellables)

        navigationController.pushViewController(viewController, animated: true)
    }
}
