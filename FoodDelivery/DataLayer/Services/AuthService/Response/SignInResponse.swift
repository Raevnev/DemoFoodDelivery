//
//  SignInResponse.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 27.01.2022.
//

struct SignInResponse: Decodable {
    let idToken: String
    let refreshToken: String
    let expiresIn: String
}
