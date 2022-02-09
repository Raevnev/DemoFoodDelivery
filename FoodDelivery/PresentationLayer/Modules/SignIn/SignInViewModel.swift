//
//  SignInViewModel.swift
//  FoodDelivery
//
//  Created by Денис Раевнёв on 26.01.2022.
//

import Combine

class SignInViewModel: ObservableObject {
    
    let signInEvent = PassthroughSubject<Void, Never>()
    let signInSuccesEvent = PassthroughSubject<Void, Never>()
    let signUpEvent = PassthroughSubject<Void, Never>()

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSingInButtonEnabled: Bool = false
    @Published var isLoadingSingIn: Bool = false
    
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
            .assign(to: \.isSingInButtonEnabled, on: self)
            .store(in: &cancellableSet)

        signInEvent
            .compactMap { [weak self] _ -> (SignInPayload)? in
                guard let self = self else { return nil }
                return SignInPayload(email: self.email, password: self.password)
            }
            .setFailureType(to: Error.self)
            .flatMap { [weak self] payload -> AnyPublisher<String, Error> in
                guard let self = self else { return .empty }
                
                self.isLoadingSingIn = true
                return self.authService.signIn(payload: payload)
            }
            .sink { [weak self] comletion in
                guard let self = self else { return }
                self.isLoadingSingIn = false
                
                switch comletion  {
                case let .failure(error):
                    print("ошибка", error.localizedDescription)

                case .finished:
                    print("finished")
                }
                
            } receiveValue: { [weak self] token in
                guard let self = self else { return }
                
                self.isLoadingSingIn = false
                self.tokenManager.saveToken(token)
                self.signInSuccesEvent.send(())
                print("успешно зарегестрировались", token)
            }
            .store(in: &cancellableSet)
    }
}
