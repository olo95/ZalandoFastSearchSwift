//
//  LoginViewController.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import RxCocoa

class LoginViewController: BaseViewController {
    
    let viewModel: LoginViewModel
    lazy var mainView: LoginView = {
       return view as! LoginView
    }()
    
    override func loadView() {
        view = LoginView()
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
