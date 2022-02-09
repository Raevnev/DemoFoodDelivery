//
//  UIView+shadow.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 01.02.2022.
//

import Foundation
import UIKit

extension UIView {

    func dropShadow(opacity: Float = 0.07, offSet: CGSize, radius: CGFloat = 15, color: UIColor, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
      }
}
