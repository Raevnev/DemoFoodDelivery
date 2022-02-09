//
//  SignUpViewModel.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 18.01.2022.
//

import Combine
 
class SignUpViewModel: ObservableObject {
    
    // events for view      приходит от вью
    let signUpEvent = PassthroughSubject<Void, Never>()
    let signUpSuccesEvent = PassthroughSubject<Void, Never>()
    let signInEvent = PassthroughSubject<Void, Never>()
    
    // state for view      
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSingUpButtonEnabled: Bool = false
    @Published var isLoadingSingUp: Bool = false

    private let authService: AuthService
    private let tokenManager: TokenManager
    private var cancellableSet = Set<AnyCancellable>()
    
    init(authService: AuthService, tokenManager: TokenManager) {
        self.authService = authService
        self.tokenManager = tokenManager
        
        setupBindings()
    }
    
    private func setupBindings() {
        
        let isEmailValidPablisher = $email
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        let isPasswordValidPablisher = $password
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        Publishers.CombineLatest(isEmailValidPablisher, isPasswordValidPablisher)
            .map { (value:(isEmailValid: Bool, isPasswordValid: Bool)) in
                return value.isEmailValid && value.isPasswordValid
            }
//            .map { $0.0 && $0.1 }   короткая запись map
            .assign(to: \.isSingUpButtonEnabled, on: self)
//            .sink { value in
//                self.isSingUpButtonEnabled = value   то же самое, что и вверху
//            }
            .store(in: &cancellableSet)
        
        signUpEvent
            .compactMap { [weak self] _ -> (SignUpPayload)? in
                guard let self = self else { return nil }
                return SignUpPayload(email: self.email, password: self.password)
            }
            .setFailureType(to: Error.self)
            .flatMap { [weak self] payload -> AnyPublisher<String, Error> in
                guard let self = self else { return .empty }
                
                self.isLoadingSingUp = true
                return self.authService.signUp(payload: payload)
            }
            .sink { [weak self] comletion in 
                guard let self = self else { return }
                self.isLoadingSingUp = false
                
                switch comletion  {
                case let .failure(error):
                    print("ошибка", error.localizedDescription)

                case .finished:
                    print("finished")
                }
                
            } receiveValue: { [weak self] token in
                guard let self = self else { return }
                
                self.isLoadingSingUp = false
                self.tokenManager.saveToken(token)
                self.signUpSuccesEvent.send(())
                print("успешно зарегестрировались", token)
            }
            .store(in: &cancellableSet)
    }
}
