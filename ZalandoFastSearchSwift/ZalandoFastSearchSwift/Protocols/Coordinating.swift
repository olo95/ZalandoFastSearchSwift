//
//  Coordinator.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 09/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import class UIKit.UINavigationController
import class UIKit.UIViewController
import class UIKit.CATransaction

protocol Coordinating: class {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinating] { get set }
    var rootCoordinator: Coordinating { get }
    var parentCoordinator: Coordinating? { get set }
    
    func addNew(coordinator: Coordinating, fromRoot: Bool, completionHandler: (() -> ())?)
    func addChild(coordinator: Coordinating)
    func removeChild(coordinator: Coordinating)
    
    func present(viewController: UIViewController, completionHandler: (() -> ())?)
    func dismiss(viewController: UIViewController, completionHandler: (() -> ())?)
    func push(viewController: UIViewController, completionHandler: (() -> ())?)
    func pop(completionHandler: (() -> ())?)
    
    func start()
    init(parent: Coordinating?)
}

extension Coordinating {
    var rootCoordinator: Coordinating {
        guard let parent = parentCoordinator else { return self }
        return parent
    }
    
    func addNew(coordinator: Coordinating, fromRoot: Bool, completionHandler: (() -> ())?) {
        if fromRoot {
            if let parent = parentCoordinator {
                self.childCoordinators.removeAll()
                navigationController.dismiss(animated: false) {
                    parent.addNew(coordinator: coordinator, fromRoot: fromRoot) {
                        completionHandler?()
                    }
                }
            } else {
                self.childCoordinators.append(coordinator)
                coordinator.start()
                present(viewController: coordinator.navigationController) {
                    completionHandler?()
                }
            }
        } else {
            self.childCoordinators.append(coordinator)
            coordinator.start()
            present(viewController: coordinator.navigationController) {
                completionHandler?()
            }
        }
    }
    
    func addChild(coordinator: Coordinating) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(coordinator: Coordinating) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
    
    func push(viewController: UIViewController, completionHandler: (() -> ())?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        navigationController.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
    
    func pop(completionHandler: (() -> ())?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        navigationController.popViewController(animated: true)
        CATransaction.commit()
    }
    
    func present(viewController: UIViewController, completionHandler: (() -> ())?) {
        navigationController.present(viewController, animated: true) {
            completionHandler?()
        }
    }
    
    func dismiss(viewController: UIViewController, completionHandler: (() -> ())?) {
        viewController.dismiss(animated: true) {
            completionHandler?()
        }
    }
    
    
}
