//
//  UIButton+Combine.swift
//  FoodDelivery
//
//  Created by Andrey Raevnev on 17.01.2022.
//

import UIKit
import Combine

extension UIButton {

    var tapPublisher: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: .touchUpInside)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}
