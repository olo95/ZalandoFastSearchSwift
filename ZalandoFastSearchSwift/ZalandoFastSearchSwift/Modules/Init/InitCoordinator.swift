//
//  InitCoordinator.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import class UIKit.UINavigationController
import class UIKit.UIViewController
import class UIKit.UIWindow
import class UIKit.UIScreen

class InitCoordinator: Coordinating {
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    
    var childCoordinators: [Coordinating] = []
    var parentCoordinator: Coordinating?
    
    func start() {
        navigationController.setViewControllers([UIViewController()], animated: false)
        addNew(coordinator: AuthenticationCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
    
    init(parent: Coordinating?, window: UIWindow) {
        self.parentCoordinator = parent
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    required init(parent: Coordinating?) {
        self.parentCoordinator = parent
    }
}
