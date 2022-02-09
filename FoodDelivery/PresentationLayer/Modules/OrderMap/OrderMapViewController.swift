//
//  OrderMapViewController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 02.02.2022.
//

import UIKit
import Combine
   
class OrderMapViewController: UIViewController {
    
    let viewModel: OrderMapViewModel
    let rootView = OrderMapView()
    
    var cancellableSet = Set<AnyCancellable>()
    
    init(viewModel: OrderMapViewModel) {
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
        rootView.backButton.tapPublisher
            .subscribe(viewModel.backEvent)
            .store(in: &cancellableSet)
    }
}
