//
//  UIViewExtension.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import UIKit

extension UIView {
    func setConstraints(
        top: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        pTop: CGFloat = .zero,
        pTrailing: CGFloat = .zero,
        pBottom: CGFloat = .zero,
        pLeading: CGFloat = .zero
    ){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -pTrailing).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: pLeading).isActive = true
        }
    }
    
    func fillSuperView(widthPadding: CGFloat = .zero) {
        guard let superview = self.superview else { return }
        setConstraints(
            top: superview.topAnchor,
            trailing: superview.trailingAnchor,
            bottom: superview.bottomAnchor,
            leading: superview.leadingAnchor,
            pTop: widthPadding,
            pTrailing: widthPadding,
            pBottom: widthPadding,
            pLeading: widthPadding
        )
    }
    
    func centerY(withValue value: CGFloat = .zero) {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: value).isActive = true
    }
    
    func centerX(withValue value: CGFloat = .zero) {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: value).isActive = true
    }
    
    func centerXY() {
        centerY()
        centerX()
    }
    
    func setHeightConstraint(with height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidthConstraint(with width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setCornerRadius(withValue value: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = value
    }
}
