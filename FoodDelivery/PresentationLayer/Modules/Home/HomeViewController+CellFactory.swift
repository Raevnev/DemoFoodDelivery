//
//  HomeViewController+CellFactory.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 09.02.2022.
//

import Foundation
import UIKit

extension HomeViewController {
    
    final class CellFactory {
        
        private let viewModel: HomeViewModel
        
        init(viewModel: HomeViewModel) {
            self.viewModel =  viewModel
        }
        
        func make(collectionView: UICollectionView, indexPath: IndexPath, item: HomeMenu) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCell.reuseId, for: indexPath) as? HomeMenuCell
                else {
                    fatalError("Could not dequeue cell wich identifier:\(HomeMenuCell.reuseId)")
                }
            print("item \(item)")
            cell.configure(menu: item)
            
            return cell
        }
    }
}
