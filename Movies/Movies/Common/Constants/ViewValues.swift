//
//  ViewValues.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import UIKit

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
    
    static let widthScreen = UIScreen.main.bounds.width
    static let doubleCollectionPadding: CGFloat = 10
    static let normalCollectionPadding: CGFloat = 5
    static let multiplierTwo: CGFloat = 2
    
    static let collectionViewTopAnchor: CGFloat = 20
    
    static let containerCornerRadius: CGFloat = 10
    static let movieImageHeight: CGFloat = 200
    static let defaultMovieLabelFontSize: CGFloat = 14
    static let descriptionMovieLabelFontSize: CGFloat = 12
    
    static let movieItemHeight: CGFloat = 400
    static let titleImageLabelPadding: CGFloat = 10
    
    static let dateMovieLabelTop: CGFloat = 20
    static let dateMovieLabelLeading: CGFloat = 10
    
    static let scoreMovieLabelTrailing: CGFloat = 10
    static let scoreMovieLabelLeading: CGFloat = 5
    
    static let descriptionMovieLabelTopBottom: CGFloat = 20
    static let descriptionMovieLabelLeadingTrailing: CGFloat = 10
}
