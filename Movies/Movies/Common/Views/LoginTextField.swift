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
        setHeightConstraint(with: ViewValues.loginTextFieldHeight)
        setCornerRadius(withValue: ViewValues.loginTextFieldCornerRadius)
    }
}
