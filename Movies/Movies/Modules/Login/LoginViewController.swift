//
//  LoginViewController.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//  
//

import UIKit

class LoginViewController: UIViewController {
    
// MARK: - Private Properties
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
        return textField
    }()

    var presenter: Login_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.addSubview(backgroundImageView)
        backgroundImageView.fillSuperView()
        
        view.addSubview(iconLoginImageView)
        iconLoginImageView.centerX()
        iconLoginImageView.centerY(withValue: ViewValues.iconLoginImageViewCenterYAnchor)
        
        view.addSubview(usernameTextField)
        usernameTextField.setConstraints(
            top: iconLoginImageView.bottomAnchor,
            trailing: view.trailingAnchor,
            leading: view.leadingAnchor,
            pTop: ViewValues.usernameTextFieldTopAnchor,
            pTrailing: ViewValues.loginTextFieldTrailingAndLeadingAnchor,
            pLeading: ViewValues.loginTextFieldTrailingAndLeadingAnchor)
        
        view.addSubview(passwordTextField)
        passwordTextField.setConstraints(
            top: usernameTextField.bottomAnchor,
            trailing: view.trailingAnchor,
            leading: view.leadingAnchor,
            pTop: ViewValues.passwordTextFieldTopAnchor,
            pTrailing: ViewValues.loginTextFieldTrailingAndLeadingAnchor,
            pLeading: ViewValues.loginTextFieldTrailingAndLeadingAnchor)
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension LoginViewController: Login_PresenterToViewProtocol {
}
