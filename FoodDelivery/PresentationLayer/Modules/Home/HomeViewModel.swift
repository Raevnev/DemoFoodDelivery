//
//  HomeViewModel.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import Combine

class HomeViewModel: ObservableObject {
    
    let logoutEvent = PassthroughSubject<Void, Never>()
    let mapEvent = PassthroughSubject<Void, Never>()
}
