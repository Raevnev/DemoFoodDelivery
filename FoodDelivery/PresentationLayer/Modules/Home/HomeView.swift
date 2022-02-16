//
//  HomeView.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import UIKit
import SnapKit

class HomeView: UIView {

    let logoImageView = UIImageView()
    let logoutButton = UIButton(type: .system)
    let titleLabel = UILabel()
    let notificationButton = NotificationButton()
    let searchTextInput = SearchInput()
    let filterButton = FilterButton()
    let stackView = UIStackView()
    let subTitleLabel = UILabel()
    
    lazy var collectinView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white

        addSubview(logoImageView)
        addSubview(notificationButton)
        addSubview(searchTextInput)
        addSubview(logoutButton)
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(subTitleLabel)
        addSubview(collectinView)
        
        logoImageView.image = R.image.pattern_home()
        
        logoutButton.setTitle(R.string.localization.mainButtonLogOut(), for: .normal)
        
        titleLabel.text = R.string.localization.mainTitle()
        titleLabel.font = .boldSystemFont(ofSize: 31)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left

        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(searchTextInput)
        stackView.addArrangedSubview(filterButton)
        
        subTitleLabel.text = R.string.localization.mainSubTitle()
        subTitleLabel.font = .boldSystemFont(ofSize: 15)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textAlignment = .left
        
        collectinView.backgroundColor = .white
        collectinView.register(HomeMenuCell.self, forCellWithReuseIdentifier: HomeMenuCell.reuseId)
        
        let bottomInset: CGFloat = 20 + 74 + 10 + safeAreaInsets.bottom
        collectinView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
    }
    
    private func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(31)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(71)
            make.right.equalToSuperview().offset(-39)
            make.size.equalTo(45)
        }
            
        logoutButton.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(35)
        }

        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(25)
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(31)
        }
        
        collectinView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(87))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        section.interGroupSpacing = 20
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        return UICollectionViewCompositionalLayout(section: section, configuration: config)
    }
}
