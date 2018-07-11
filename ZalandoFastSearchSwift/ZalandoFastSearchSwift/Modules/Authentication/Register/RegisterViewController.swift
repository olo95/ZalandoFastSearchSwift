//
//  RegisterViewController.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 11/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import RxCocoa
import class RxSwift.DisposeBag
import class RxSwift.Observable

class RegisterViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel: RegisterViewModel
    private lazy var mainView: RegisterView = {
        return view as! RegisterView
    }()
    
    override func loadView() {
        view = RegisterView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setUI()
        bindUI()
    }
    
    private func setUI() {
        
    }
    
    private func bindUI() {
        Observable.combineLatest(mainView.loginTextField.rx.text, mainView.passwordTextField.rx.text)
            .map { UserCredentials(login: $0.0!, password: $0.1!) }
            .filter { !$0.login.isEmpty && !$0.password.isEmpty }
            .sample(mainView.registerButton.rx.tap)
            .subscribe( onNext: { [viewModel] in
                if viewModel.checkUser(with: $0) {
                    if viewModel.registerUser(with: $0) {
                        viewModel.flowDelegate.registerSuccess()
                    } else {
                        viewModel.flowDelegate.registerFailed()
                    }
                } else {
                    viewModel.flowDelegate.registerFailed()
                }
            }).disposed(by: disposeBag)
    }
}
