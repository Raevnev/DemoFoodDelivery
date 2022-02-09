//
//  SignUpPayload.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 24.01.2022.
//

struct SignUpPayload {
    
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
