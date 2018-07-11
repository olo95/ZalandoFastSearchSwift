//
//  LoginViewModel.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import RxSwift

class LoginViewModel {
    
    let flowDelegate: LoginCoordinatorDelegate
    
    init(flowDelegate: LoginCoordinatorDelegate) {
        self.flowDelegate = flowDelegate
    }
}
