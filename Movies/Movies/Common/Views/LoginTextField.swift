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
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.configuration = configuration
        setPasswordToggleImage(button)
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    private func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)

        }
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
