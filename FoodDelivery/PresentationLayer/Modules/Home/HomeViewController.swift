//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import Combine
   
class HomeViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<HomeSection, HomeMenu>
    
    private lazy var dataSource: DataSource = createDataSource()
    private lazy var cellFactory = CellFactory(viewModel: viewModel)
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
        
        viewModel.viewDidLoadEvent.send(())
    }
    
    private func setupBindings() {
        rootView.logoutButton.tapPublisher
            .subscribe(viewModel.logoutEvent)
            .store(in: &cancellableSet)
  
        viewModel.$menus.sink { [weak self] menus in
            self?.updateDataSource(menus: menus)
        }.store(in: &cancellableSet)
    }
    
    private func updateDataSource(menus: [HomeMenu]) {
        var snapshot = dataSource.snapshot()
        
        snapshot.deleteAllItems()
        snapshot.appendSections([.popularMenu])
        snapshot.appendItems(menus)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
    }
    
    private func createDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: rootView.collectinView) { [weak self] collectionView, indexPath, item in
            return self?.cellFactory.make(collectionView: collectionView, indexPath: indexPath, item: item)
        }
        return dataSource
    }
}
