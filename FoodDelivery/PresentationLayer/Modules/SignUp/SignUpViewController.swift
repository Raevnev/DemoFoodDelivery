//
//  SignUpViewController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 18.01.2022.
//

import UIKit
import Combine
   
class SignUpViewController: UIViewController {
    
    let viewModel: SignUpViewModel
    let rootView = SignUpView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: SignUpViewModel) {
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
        rootView.createButton.tapPublisher
            .subscribe(viewModel.signUpEvent)
            .store(in: &cancellableSet)
        
        rootView.alreadyButton.tapPublisher
            .subscribe(viewModel.signInEvent)
            .store(in: &cancellableSet)
        
        rootView.emailTextInput.textField.textPublisher
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellableSet)

        rootView.passwordTextInput.textField.textPublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellableSet)
        
        viewModel.$isSingUpButtonEnabled
            .assign(to: \.isEnabled, on: rootView.createButton)
            .store(in: &cancellableSet)
    }
}
 
