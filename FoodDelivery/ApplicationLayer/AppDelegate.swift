//
//  AppDelegate.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 25.12.2021.
//

import UIKit
import Moya
import Combine
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var applicationCoordinator: ApplicationCoordinator!
    private var cancellables = Set<AnyCancellable>()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { 
        GMSServices.provideAPIKey("AIzaSyALGMQgS_cYBhqyX9dngZxTzqRZKvMGwNY")
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let coordinatorFactory = CoordinatorFactory()
        applicationCoordinator = ApplicationCoordinator(mainWindow: window,
                                                        coordinatorFactory: coordinatorFactory,
                                                        tokenManager: TokenManager.shared)

        applicationCoordinator.start().sink {}.store(in: &cancellables)
    
        return true
    }
    
}
