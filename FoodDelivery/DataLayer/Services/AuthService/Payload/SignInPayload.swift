//
//  SignInPayload.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 27.01.2022.
//

struct SignInPayload {
    
    let email: String
    let password: String
    
    var params: [String: Any] {
        [
            "email": email,
            "password": password,
            "returnSecureToken":true
        ]
    }
}
