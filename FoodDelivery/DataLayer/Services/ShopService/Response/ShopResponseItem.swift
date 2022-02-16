//
//  ShopResponseItem.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 09.02.2022.
//

import Foundation

struct ShopResponseItem: Decodable {
    let id: String
    let name: String
    let icon: String
    let kind: Kind
    let deliveryTime: Double?
    let price: Double?
    let description: String?
    
    enum Kind: String, Decodable {
        case restaurant = "restaurant"
        case menu = "menu"
    }  
}
