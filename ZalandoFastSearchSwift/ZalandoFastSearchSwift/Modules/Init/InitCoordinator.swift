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
    
    let window: UIWindow
    var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    
    var childCoordinators: [Coordinating] = []
    var parentCoordinator: Coordinating?
    
    func start() {
        navigationController.setViewControllers([UIViewController()], animated: false)
        addNew(coordinator: LoginCoordinator(parent: self), fromRoot: false, completionHandler: nil)
    }
    
    required init(parent: Coordinating?) {
        self.parentCoordinator = parent
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
}
