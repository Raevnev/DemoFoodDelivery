//
//  BaseCoordinator.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import Combine
import Foundation

class BaseCoordinator<ResultType>: NSObject {
    
    private let id = UUID().uuidString
    private var childCoordinators: [String: Any] = [:]
    
    var cancellables = Set<AnyCancellable>()
    
    func start() -> AnyPublisher<ResultType, Never> {
        preconditionFailure("Should be ovveriden")
    }
    
    func coordinate<T>(to coordinator: BaseCoordinator<T>) -> AnyPublisher<T, Never> {
        save(coordinator)
        
        return coordinator.start().handleEvents(receiveOutput: { [ weak self, weak coordinator] _ in
            guard let self = self, let coordinator = coordinator else { return }
            self.remove(coordinator)
        }).eraseToAnyPublisher()
    }
    
    func removeChildren() {
        childCoordinators.removeAll()
    }
    
    //MARK: - Private
    private func save<T>(_ coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.id] = coordinator
    }
    
    private func remove<T>(_ coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.id] = nil
    }
}
