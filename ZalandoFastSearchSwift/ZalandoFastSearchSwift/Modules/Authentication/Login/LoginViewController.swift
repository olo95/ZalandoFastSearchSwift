//
//  LoginViewController.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import RxCocoa
import class RxSwift.DisposeBag
import class RxSwift.Observable

class LoginViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel: LoginViewModel
    private lazy var mainView: LoginView = {
       return view as! LoginView
    }()
    
    override func loadView() {
        view = LoginView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setUI()
        bindUI()
    }
    
    private func setUI() {
    
    }
    
    private func bindUI() {
        mainView.registerButton.rx.tap
            .subscribe( onNext: { [viewModel] _ in
                viewModel.flowDelegate.registerButtonTapped()
            }).disposed(by: disposeBag)
        
        Observable.combineLatest(mainView.loginTextField.rx.text, mainView.passwordTextField.rx.text)
            .map { UserCredentials(login: $0.0!, password: $0.1!) }
            .filter { !$0.login.isEmpty && !$0.password.isEmpty }
            .sample(mainView.loginButton.rx.tap)
            .subscribe( onNext: { [viewModel] in
                if viewModel.checkUser(with: $0) {
                    viewModel.flowDelegate.loginSuccess()
                } else {
                    viewModel.flowDelegate.loginFailed()
                }
            }).disposed(by: disposeBag)
    }
}
