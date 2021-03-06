//
//  RegisterViewModel.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 11/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import RxSwift

class RegisterViewModel {
    
    let flowDelegate: RegisterCoordinatorDelegate
    
    init(flowDelegate: RegisterCoordinatorDelegate) {
        self.flowDelegate = flowDelegate
    }
    
    func checkUser(with userCredentials: UserCredentials) -> Bool {
        return CoreDataManager.shared.checkUser(with: userCredentials)
    }
    
    func registerUser(with userCredentials: UserCredentials) -> Bool {
        return CoreDataManager.shared.saveUser(with: userCredentials)
    }
}
