//
//  AuthTarget.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 24.01.2022.
//

import Moya

enum AuthTarget {
    case signUp(SignUpPayload)
    case signIn(SignInPayload)
}

extension AuthTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://identitytoolkit.googleapis.com/v1")!
    }
    
    var path: String {
        switch self{
        case .signUp:
            return "/accounts:signUp"
        case .signIn:
            return "/accounts:signInWithPassword"
        }
    }
    
    var method: Method {
        switch self{
        case .signUp:
            return .post
        case .signIn:
            return .post
        }
    }
    
    var task: Task {
        switch self{
        case let .signUp(payload):
            let urlParams: [String: String] = [
                "key": "AIzaSyC_ouyH-oZf-E-OfR_sSVKbY8kh2beX1pc"
            ]
            return .requestCompositeParameters(bodyParameters: payload.params,
                                               bodyEncoding: JSONEncoding.default,
                                               urlParameters: urlParams)
        case let .signIn(payload):
            let urlParams: [String: String] = [
                "key": "AIzaSyC_ouyH-oZf-E-OfR_sSVKbY8kh2beX1pc"
            ]
            return .requestCompositeParameters(bodyParameters: payload.params,
                                               bodyEncoding: JSONEncoding.default,
                                               urlParameters: urlParams)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
