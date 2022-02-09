//
//  SignUpSuccessViewController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import Combine
   
class SignUpSuccessViewController: UIViewController {
    
    let viewModel: SignUpSuccessViewModel
    let rootView = SignUpSuccessView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: SignUpSuccessViewModel) {
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
        rootView.tryOrderButton.tapPublisher
            .subscribe(viewModel.tryOrderEvent)
            .store(in: &cancellableSet)
    }
}
