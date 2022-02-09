//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import Combine
   
class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    let rootView = HomeView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: HomeViewModel) {
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
        rootView.logoutButton.tapPublisher
            .subscribe(viewModel.logoutEvent)
            .store(in: &cancellableSet)
  
        rootView.mapButton.tapPublisher
            .subscribe(viewModel.mapEvent)
            .store(in: &cancellableSet)
    }
}
