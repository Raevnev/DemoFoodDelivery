//
//  HomeViewModel.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 30.01.2022.
//

import Combine

class HomeViewModel: ObservableObject {
    
    let viewDidLoadEvent = PassthroughSubject<Void, Never>()
    let logoutEvent = PassthroughSubject<Void, Never>()
    let mapEvent = PassthroughSubject<Void, Never>()
    
    @Published var menus: [HomeMenu] = []
    
    private let shopService: ShopService
    private var cancellableSet = Set<AnyCancellable>()

    init(shopService: ShopService) {
        self.shopService = shopService
        
        setupBindings()
    }
    
    private func setupBindings() {
        
        viewDidLoadEvent
            .setFailureType(to: Error.self)
            .flatMap { [weak self] _ -> AnyPublisher<[ShopResponseItem], Error> in
                guard let self = self else { return .empty }
                
                return self.shopService.shops()
            }
            .sink { comletion in
                
                switch comletion  {
                case let .failure(error):
                    print("ошибка", error.localizedDescription)

                case .finished:
                    print("finished")
                }
                
            } receiveValue: { [weak self] items in
                guard let self = self else { return }
                
                print("items", items.count)
                self.menus = self.createMenus(items: items)
            }
            .store(in: &cancellableSet)
    }
    
    private func createMenus(items: [ShopResponseItem]) -> [HomeMenu] {
        let menus = items
//            .filter{ items in
//                return item.kind == .menu
//            }
            .filter{ $0.kind == .menu }
            .map { item -> HomeMenu in
                return HomeMenu(id: item.id,
                                iconUrl: item.icon,
                                title: item.name,
                                description: item.description ?? "",
                                price: item.price ?? 0)
            }
        return menus
    }
}
