//
//  ShopTarget.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 09.02.2022.
//

import Moya

enum ShopTarget {
    case shops
}

extension ShopTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://us-central1-fooddelivery-2d9a9.cloudfunctions.net")!
    }
    var path: String {
        switch self {
        case .shops:
            return "/shop"
        }
    }
    
    var method: Method {
        switch self {
        case .shops:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .shops:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
