//
//  SignUpResponse.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 24.01.2022.
//

struct SignUpResponse: Decodable {
    let idToken: String
    let refreshToken: String
    let expiresIn: String
}
