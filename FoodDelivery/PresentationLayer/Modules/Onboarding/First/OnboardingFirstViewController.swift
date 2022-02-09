//
//  OnboardingFirstViewController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import Combine
   
class OnboardingFirstViewController: UIViewController {
    
    let viewModel: OnboardingFirstViewModel
    let rootView = OnboardingFirstView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: OnboardingFirstViewModel) {
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
        rootView.nextButton.tapPublisher
            .subscribe(viewModel.nextEvent)
            .store(in: &cancellableSet)
    }
}
