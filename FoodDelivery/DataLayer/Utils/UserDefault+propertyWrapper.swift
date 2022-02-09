//
//  UserDefault+propertyWrapper.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import Foundation

@propertyWrapper
public struct Persist<T> {
    public let key: String
    public let defaultValue: T
    
    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}
