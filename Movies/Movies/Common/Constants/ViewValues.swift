//
//  ViewValues.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

struct ViewValues {
    static let iconLoginImageViewHeight: CGFloat = 150
    static let iconLoginImageViewCenterYAnchor: CGFloat = -200
    static let iconLoginImageViewCornerRadius: CGFloat = 10
    
    static let usernameTextFieldTopAnchor: CGFloat = 20
    
    static let passwordTextFieldTopAnchor: CGFloat = 10
    
    static let loginButtonTopAnchor: CGFloat = 10
    
    static let errorMessageLabelTopAnchor: CGFloat = 10
    static let errorMessageLabelTrailingAndLeadingAnchor: CGFloat = 25
    
    static let loginTextFieldTrailingAndLeadingAnchor: CGFloat = 50
    static let loginTextFieldFontSize: CGFloat = 20
    static let loginTextFieldHeight: CGFloat = 50
    static let loginTextFieldCornerRadius: CGFloat = 10
    
    static let loginButtonHeight: CGFloat = 50
    
    static let tagIdentifierSpinner = 123
    static let opacityContainerSpinner = 0.3
    
    static let paddingPasswordButton: CGFloat = 10
    
    static let itemsSegmentedControl: [String] =
    [
        AppLocalized.firstItemSegmentedControl,
        AppLocalized.secondItemSegmentedControl,
        AppLocalized.thirdItemSegmentedControl,
        AppLocalized.fourthItemSegmentedControl
    ]
    
    static let segmentedControlPadding: CGFloat = 20
    static let selectedSegmentIndexSegmentedControl = 0
    static let navigationTitleFontSize: CGFloat = 20
    
    static let righButtonFrameX: CGFloat = 0
    static let righButtonFrameY: CGFloat = 0
    static let righButtonFrameWidth: CGFloat = 34
}
