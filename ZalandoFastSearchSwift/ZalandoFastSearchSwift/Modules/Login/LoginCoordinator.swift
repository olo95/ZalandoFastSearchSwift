//
//  LoginCoordinator.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import class UIKit.UINavigationController

class LoginCoordinator: Coordinating {
    
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
