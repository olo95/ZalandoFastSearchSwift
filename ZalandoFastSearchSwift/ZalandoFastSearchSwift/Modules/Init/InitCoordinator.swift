//
//  InitCoordinator.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import class UIKit.UINavigationController

class InitCoordinator: Coordinating {
    
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    
    var childCoordinators: [Coordinating] = []
    var parentCoordinator: Coordinating?
    
    func start() {
        addNew(coordinator: LoginCoordinator(parent: self), fromRoot: true, completionHandler: nil)
    }
    
    required init(parent: Coordinating?) {
        self.parentCoordinator = parent
    }
    
    
}
