//
//  UIImage + ext.swift
//  calc
//
//  Created by Дмитрий Корчагин on 24.11.2022.
//

import UIKit

extension UIImage{
    static let named = ["arrow.down", "arrow.up", "minus"]
    static func createImages() ->[UIImage]{
        var images = [UIImage]()
        for i in 0..<3{
            let image = UIImage(systemName: UIImage.named[i])
            
            images.append(image!)
        }
        return images
    }
    func scaledImage(withSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()!
    }

    func scaleImageToFitSize(size: CGSize) -> UIImage {
        let aspect = self.size.width / self.size.height
        if size.width / aspect <= size.height {
            return scaledImage(withSize: CGSize(width: size.width, height: size.width / aspect))
        } else {
            return scaledImage(withSize: CGSize(width: size.height * aspect, height: size.height))
        }
    }

}
