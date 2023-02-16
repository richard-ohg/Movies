//
//  LoginView.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func buttonPressed()
}

final class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Images.loginBackgroundImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let iconLoginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Images.loginIcon)
        imageView.contentMode = .scaleAspectFill
        imageView.setHeightConstraint(with: ViewValues.iconLoginImageViewHeight)
        imageView.setWidthConstraint(with: ViewValues.iconLoginImageViewHeight)
        imageView.setCornerRadius(withValue: ViewValues.iconLoginImageViewCornerRadius)
        return imageView
    }()
    
    private let usernameTextField: LoginTextField = {
        let textField = LoginTextField()
        textField.placeholder = AppLocalized.usernamePlaceholder
        return textField
    }()
    
    private let passwordTextField: LoginTextField = {
        let textField = LoginTextField()
        textField.placeholder = AppLocalized.passwordPlaceholder
        textField.textContentType = .password
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(AppLocalized.loginTitleButton, for: .normal)
        button.backgroundColor = .lightGray
        button.setHeightConstraint(with: ViewValues.loginButtonHeight)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    init(delegate: LoginViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        [backgroundImageView, iconLoginImageView, usernameTextField, passwordTextField, loginButton].forEach(addSubview)
    }
    
    private func addConstraints() {
        backgroundImageView.fillSuperView()
        
        iconLoginImageView.centerX()
        iconLoginImageView.centerY(withValue: ViewValues.iconLoginImageViewCenterYAnchor)
        
        usernameTextField.setConstraints(
            top: iconLoginImageView.bottomAnchor,
            trailing: trailingAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.usernameTextFieldTopAnchor,
            pTrailing: ViewValues.loginTextFieldTrailingAndLeadingAnchor,
            pLeading: ViewValues.loginTextFieldTrailingAndLeadingAnchor)
        
        passwordTextField.setConstraints(
            top: usernameTextField.bottomAnchor,
            trailing: trailingAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.passwordTextFieldTopAnchor,
            pTrailing: ViewValues.loginTextFieldTrailingAndLeadingAnchor,
            pLeading: ViewValues.loginTextFieldTrailingAndLeadingAnchor)
        
        loginButton.setConstraints(
            top: passwordTextField.bottomAnchor,
            trailing: trailingAnchor,
            leading: leadingAnchor,
            pTop: ViewValues.loginButtonTopAnchor,
            pTrailing: ViewValues.loginTextFieldTrailingAndLeadingAnchor,
            pLeading: ViewValues.loginTextFieldTrailingAndLeadingAnchor)
    }
    
    @objc func loginButtonPressed() {
        delegate?.buttonPressed()
    }
}
