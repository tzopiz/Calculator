//
//  UITextField + ext.swift
//  calc
//
//  Created by Дмитрий Корчагин on 24.11.2022.
//

import UIKit

extension UITextField{
    static func createCustomTextField() -> UITextField{
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .bezel
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.textAlignment = .right
        textField.isUserInteractionEnabled = false
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "Enter expression"
        textField.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 30)!
        return textField
    }

}
