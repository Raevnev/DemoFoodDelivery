//
//  ApplicationCoordinator.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import Combine
import Foundation
import UIKit
import Moya

class ApplicationCoordinator: BaseCoordinator<Void> {
    
    private let mainWindow: UIWindow
    private let coordinatorFactory: CoordinatorFactory
    private let tokenManager: TokenManager
    private var navigationController = UINavigationController()
    
    @Persist(key: "isOnboardingShowed", defaultValue: false)
    private var isOnboardingShowed: Bool
    
    init(mainWindow: UIWindow, coordinatorFactory: CoordinatorFactory, tokenManager: TokenManager) {
        self.mainWindow = mainWindow
        self.coordinatorFactory = coordinatorFactory
        self.tokenManager = tokenManager
        super.init()
        
        navigationController.navigationBar.isHidden = true
    }
    
    override func start() -> AnyPublisher<Void, Never> {
        return Deferred<AnyPublisher<Void, Never>> { [weak self] in
            guard let self = self else { return Empty(completeImmediately: false).eraseToAnyPublisher()}
            
            self.runApplicationFlow()
            self.mainWindow.makeKeyAndVisible()
            
            return Empty(completeImmediately: false).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
    private func runApplicationFlow() {
        mainWindow.rootViewController = navigationController
        
        if tokenManager.isAuthorized {
            runMainFlow()
            return
        }
         
        if isOnboardingShowed {
            runSignInFlow()
        } else {
            runOnboardingFirst()
        }
    }
    
    private func runOnboardingFirst() {
        let viewModel = OnboardingFirstViewModel()
        let viewController = OnboardingFirstViewController(viewModel: viewModel)
        
        viewModel.nextEvent.sink { [weak self] in
            self?.runOnboardingSecond()
        }.store(in: &cancellables)

        navigationController.setViewControllers([viewController], animated: false)
    }
    
    private func runOnboardingSecond() {
        let viewModel = OnboardingSecondViewModel()
        let viewController = OnboardingSecondViewController(viewModel: viewModel)
        
        viewModel.nextEvent.sink { [weak self] in
            self?.isOnboardingShowed = true
            self?.runSignInFlow()
        }.store(in: &cancellables)

        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func runSignInFlow() {
        let provider = MoyaProvider<AuthTarget>(plugins: [])
        let authService: AuthService = AuthServiceImp(provider: provider)

        let viewModel = SignInViewModel(authService: authService, tokenManager: TokenManager.shared)
        let viewController = SignInViewController(viewModel: viewModel)

        viewModel.signUpEvent.sink { [weak self] _ in
            self?.runSignUpFlow()
        }.store(in: &cancellables)

        viewModel.signInSuccesEvent.sink { [weak self] _ in
            self?.runMainFlow()
        }.store(in: &cancellables)
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func runSignUpFlow() {
        let provider = MoyaProvider<AuthTarget>(plugins: [])
        let authService: AuthService = AuthServiceImp(provider: provider)

        let viewModel = SignUpViewModel(authService: authService, tokenManager: TokenManager.shared)
        let viewController = SignUpViewController(viewModel: viewModel)

        viewModel.signInEvent.sink { [weak self] _ in
            self?.runSignInFlow()
        }.store(in: &cancellables)
        
        viewModel.signUpSuccesEvent.sink { [weak self] _ in
            self?.runSignUpSuccessView()
        }.store(in: &cancellables)
       
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func runSignUpSuccessView() {
        let viewModel = SignUpSuccessViewModel()
        let viewController = SignUpSuccessViewController(viewModel: viewModel)
        
        viewModel.tryOrderEvent.sink { [weak self] in
            self?.runMainFlow()
        }.store(in: &cancellables)

        navigationController.setViewControllers([viewController], animated: false)
    }
    
    private func runMainFlow() {
        let coordinator = coordinatorFactory.createMainCoordinator(window: mainWindow)
        
        coordinate(to: coordinator).sink { [weak self] _ in
            
            self?.mainWindow.rootViewController = self?.navigationController
            self?.runSignInFlow()
            
        }.store(in: &cancellables)
    }
}

