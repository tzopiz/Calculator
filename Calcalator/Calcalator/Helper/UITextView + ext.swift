//
//  UITextView + ext.swift
//  calc
//
//  Created by Дмитрий Корчагин on 24.11.2022.
//

import UIKit

extension UITextView{
    static func createBigTextView() -> UITextView{
        let textview = UITextView()
        textview.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 23)!
        textview.textAlignment = .right
        textview.text = ""
        textview.layer.borderColor = UIColor.black.cgColor
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.backgroundColor = .white
        textview.isUserInteractionEnabled = true // но можно было скролить
        textview.isEditable = false // чтобы нельзя было менять текст
        return textview
    }
    static func createSmallTextView() -> UITextView{
        let textview = UITextView()
        textview.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 19)!
        textview.textAlignment = .right
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textview.isEditable = false
        textview.scrollIndicatorInsets = textview.contentInset
        textview.layer.cornerRadius = 7
        return textview
    }
}
