//
//  TokenManager.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import Foundation

class TokenManager {
    
    static let shared = TokenManager()
    
    @Persist(key: "token", defaultValue: "")
    private var token: String
    
    init() {
        
    }
    
    func saveToken(_ token: String) {
        self.token = token
    }
    
    func removeToken() {
        token = ""
    }
    
    var isAuthorized: Bool {
        !token.isEmpty
    }
}
