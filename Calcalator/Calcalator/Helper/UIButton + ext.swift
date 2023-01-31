//
//  UIButton + ext.swift
//  calc
//
//  Created by Дмитрий Корчагин on 24.11.2022.
//

import UIKit

extension UIButton{
    static let buttonsTitles = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "÷", "+", "-", "•",  "=", ".", "<", "%", "AC" ]
    static func createNumbersButtons() -> [UIButton]{
        var buttons = [UIButton]()
        for i in 0..<19{
            let button = UIButton(type: .system)
            if (i < 10){ button.setTitleColor(.white, for: .normal) }
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(UIButton.buttonsTitles[i], for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = #colorLiteral(red: 0.6620279901, green: 0.6620279901, blue: 0.6620279901, alpha: 0.714631165)
            button.backgroundColor = .systemGray4
            button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 30)!
            button.tag = 1
            if i == 0{
                button.tag = 0
            }
            buttons.append(button)
        }
        return buttons
    }
    
}

