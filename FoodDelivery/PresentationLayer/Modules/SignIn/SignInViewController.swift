//
//  SignInViewController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 26.01.2022.
//

import UIKit
import Combine
   
class SignInViewController: UIViewController {
    
    let viewModel: SignInViewModel
    let rootView = SignInView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupBindings()
    }
    
    private func setupBindings() {
        rootView.loginButton.tapPublisher
            .subscribe(viewModel.signInEvent)
            .store(in: &cancellableSet)
        
        rootView.signUpButton.tapPublisher
            .subscribe(viewModel.signUpEvent)
            .store(in: &cancellableSet)
        
        rootView.emailTextInput.textField.textPublisher
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellableSet)

        rootView.passwordTextInput.textField.textPublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellableSet)

        viewModel.$isSingInButtonEnabled
            .assign(to: \.isEnabled, on: rootView.loginButton)
            .store(in: &cancellableSet)
    }
}
