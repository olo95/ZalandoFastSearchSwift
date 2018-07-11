//
//  LoginView.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import FlexLayout
import PinLayout
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialTextFields

class LoginView: BaseView {
    
    private let rootFlexContainer: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.background.value
        return view
    }()
    
    private let contentView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorTheme.background.value
        return scrollView
    }()
    
    private let loginContainer: UIView = {
        let view = UIView()
        view.backgroundColor = ColorTheme.surface.value
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let loginTextField: MDCTextField = {
        let textField = MDCTextField()
        return textField
    }()
    
    let passwordTextField: MDCTextField = {
        let textField = MDCTextField()
        return textField
    }()
    
    let loginButton: MDCButton = {
        let button = MDCButton(type: .system)
        button.backgroundColor = ColorTheme.primary.value
        button.setTitle("Login", for: .normal)
        button.setTitleColor(ColorTheme.onPrimary.value, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let registerButton: MDCButton = {
        let button = MDCButton(type: .system)
        button.backgroundColor = ColorTheme.primary.value
        button.setTitle("Register", for: .normal)
        button.setTitleColor(ColorTheme.onPrimary.value, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private var loginTextFieldController: MDCTextInputControllerOutlined?
    private var passwordTextFieldController: MDCTextInputControllerOutlined?
    
    override init() {
        super.init()
        setTextFieldInputControllers()
        setContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTextFieldInputControllers() {
        loginTextFieldController = MDCTextInputControllerOutlined(textInput: loginTextField)
        passwordTextFieldController = MDCTextInputControllerOutlined(textInput: passwordTextField)
        loginTextFieldController?.placeholderText = "Login"
        passwordTextFieldController?.placeholderText = "Password"
        loginTextFieldController?.floatingPlaceholderActiveColor = ColorTheme.primary.value
        passwordTextFieldController?.floatingPlaceholderActiveColor = ColorTheme.primary.value
        loginTextFieldController?.activeColor = ColorTheme.primary.value
        passwordTextFieldController?.activeColor = ColorTheme.primary.value
        loginTextFieldController?.normalColor = ColorTheme.onPrimary.value
        passwordTextFieldController?.normalColor = ColorTheme.onPrimary.value
    }
    
    private func setContainer() {
        rootFlexContainer.flex
            .define { flex in
                flex.addItem(loginContainer)
                    .margin(64, 8, 8, 8)
                    .grow(1)
                    .shadow(shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.5, shadowRadius: 1.0)
                    .direction(.column)
                    .define { flex in
                        flex.addItem(titleLabel).marginBottom(8).marginRight(8).marginLeft(8)
                        flex.addItem(loginTextField).marginBottom(8).marginRight(8).marginLeft(8)
                        flex.addItem(passwordTextField).marginBottom(8).marginRight(8).marginLeft(8)
                        flex.addItem(loginButton).width(128).height(48).alignSelf(.center).marginBottom(8)
                        flex.addItem(registerButton).width(128).height(48).alignSelf(.center).marginBottom(8)
                }
        }
        
        addSubview(contentView)
        contentView.addSubview(rootFlexContainer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        super.layoutSubviews()
        contentView.pin.all()
        rootFlexContainer.pin.top().left().right()
        rootFlexContainer.flex.layout(mode: .adjustHeight)
        contentView.contentSize = rootFlexContainer.frame.size
    }
}
