//
//  SectionHeader.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 17/02/23.
//

import UIKit

class SectionHeader: UICollectionReusableView, Reusable {
     private let label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
         label.sizeToFit()
         return label
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)

         label.translatesAutoresizingMaskIntoConstraints = false
         label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
         label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
         label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(text: String, textColor: UIColor = .white, font: UIFont = UIFont.systemFont(ofSize: 16, weight: .semibold)) {
        label.text = text
        label.textColor = textColor
        label.font = font
    }
}
