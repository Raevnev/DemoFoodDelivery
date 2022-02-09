//
//  Response+decode.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 24.01.2022.
//

import Combine
import Moya

extension Publisher where Output == Moya.Response {
    
    func decode<T: Decodable>(type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        return tryMap { (response: Response) -> T in
            return try decoder.decode(T.self, from: response.data)
        }
        .eraseToAnyPublisher()
    }
    
    func toVoid() -> AnyPublisher<Void, Error> {
        return tryMap { _ -> Void in
            return()
        }.eraseToAnyPublisher()
    }
}
