//
//  AnyPublisher+.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 24.01.2022.
//

import Combine

extension AnyPublisher {
    static var empty: AnyPublisher {
        Empty()
            .eraseToAnyPublisher()
    }
    
    static func just(_ output: Output) -> Self {
        Just(output)
            .setFailureType(to: Failure.self)
            .eraseToAnyPublisher()
    }
    
    static func fail(error: Failure) -> Self {
        Fail(error: error)
            .eraseToAnyPublisher()
    }
}
