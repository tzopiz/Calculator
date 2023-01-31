//
//  UIView + ext.swift
//  calc
//
//  Created by Дмитрий Корчагин on 24.11.2022.
//

import UIKit

extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }

    func setTintColor(_ color: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        self.navigationBar.tintColor = color
    }

    func backgroundColor(_ color: UIColor) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.barTintColor = color
        navigationBar.shadowImage = UIImage()
    }
}


/*
 self.navigationController?.navigationBar.layer.masksToBounds = false
 self.navigationController?.navigationBar.layer.shadowColor = UIColor.systemBlue.cgColor
 self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
 self.navigationController?.navigationBar.layer.shadowRadius = 10
 self.navigationController?.navigationBar.layer.shadowOpacity = 0.7
 */
