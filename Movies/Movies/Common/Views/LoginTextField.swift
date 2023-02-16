//
//  LoginTextField.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import UIKit

class LoginTextField: UITextField {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        font = UIFont.systemFont(ofSize: ViewValues.loginTextFieldFontSize)
        borderStyle = .roundedRect
        autocapitalizationType = .none
        setHeightConstraint(with: ViewValues.loginTextFieldHeight)
        setCornerRadius(withValue: ViewValues.loginTextFieldCornerRadius)
    }
    
    func enablePasswordToggle() {
        var configuration = UIButton.Configuration.borderless()
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: ViewValues.paddingPasswordButton,
            leading: ViewValues.paddingPasswordButton,
            bottom: ViewValues.paddingPasswordButton,
            trailing: ViewValues.paddingPasswordButton)
        configuration.baseForegroundColor = .black
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.configuration = configuration
        setPasswordToggleImage(button)
        button.addTarget(
            self,
            action: #selector(self.togglePasswordView),
            for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    private func setPasswordToggleImage(_ button: UIButton) {
        let imageName = isSecureTextEntry ? Images.showPasswordImageButton : Images.hidePasswordImageButton
        button.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func togglePasswordView(_ sender: UIButton) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender)
    }
}
