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
    
    private let rootFlexContainer = UIView()
    private let contentView = UIScrollView()
    private let loginContainer = UIView()
    private let titleLabel = UIView()
    private let loginTextField = MDCTextField()
    private let passwordTextField = MDCTextField()
    private let loginButton = MDCButton()
    private let registerButton = MDCButton()
    
    private lazy var loginTextFieldController: MDCTextInputControllerOutlined = {
        let textFieldController = MDCTextInputControllerOutlined(textInput: loginTextField)
        return textFieldController
    }()
    
    private lazy var passwordTextFieldController: MDCTextInputControllerOutlined = {
        let textFieldController = MDCTextInputControllerOutlined(textInput: loginTextField)
        return textFieldController
    }()
    
    override init() {
        super.init()
        setContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContainer() {
        rootFlexContainer.flex
            .backgroundColor(ColorTheme.background.value)
            .define { flex in
                flex.addItem()
                    .marginTop(33%)
                    .marginLeft(8)
                    .marginRight(8)
                    .marginBottom(10%)
                    .shadow(shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.5, shadowRadius: 1.0)
                    .backgroundColor(ColorTheme.surface.value)
                    .define { flex in
                        flex.addItem(titleLabel)
                        flex.addItem(loginTextField)
                        flex.addItem(passwordTextField)
                        flex.addItem(loginButton)
                        flex.addItem(registerButton)
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
