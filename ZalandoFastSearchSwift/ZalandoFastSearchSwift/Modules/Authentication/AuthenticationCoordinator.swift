//
//  AuthenticationCoordinator.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 11/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import class UIKit.UINavigationController

protocol RegisterCoordinatorDelegate {
    func registerSuccess()
    func registerFailed()
}

protocol LoginCoordinatorDelegate {
    func loginSuccess()
    func loginFailed()
    func registerButtonTapped()
}

class AuthenticationCoordinator: Coordinating {
    
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    
    var childCoordinators: [Coordinating] = []
    var parentCoordinator: Coordinating?
    
    func start() {
        navigationController.setViewControllers([LoginViewController(viewModel: LoginViewModel(flowDelegate: self))], animated: true)
    }
    
    required init(parent: Coordinating?) {
        self.parentCoordinator = parent
    }
}

extension AuthenticationCoordinator: RegisterCoordinatorDelegate {
    func registerSuccess() {
        pop(completionHandler: nil)
    }
    
    func registerFailed() {
        
    }
}

extension AuthenticationCoordinator: LoginCoordinatorDelegate {
    func loginSuccess() {
        
    }
    
    func loginFailed() {
        
    }
    
    func registerButtonTapped() {
        push(viewController: RegisterViewController(viewModel: RegisterViewModel(flowDelegate: self)), completionHandler: nil)
    }
}
