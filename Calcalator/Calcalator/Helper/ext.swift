//
//  ext.swift
//  calc
//
//  Created by Дмитрий Корчагин on 20.11.2022.
//

import Foundation
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
/*
 let str = "Hello, playground"
 print(str.substring(from: 7))         // playground
 print(str.substring(to: 5))           // Hello
 print(str.substring(with: 7..<11))    // play
 */
struct Constants {
    static let apiUrl = "https://api.unsplash.com/photos/?client_id={Key}&order_by=ORDER&per_page=4"
}
func firstNumberOf(string: String, ch: Character) -> Int{
    var i = 0
    for c in string{
        if c == ch{
            return i
        }
        i += 1
    }
    return -1
}
func lastNumberOf(string: String, ch: Character) -> Int{
    var i = 0
    var ans = i
    for c in string{
        if c == ch{
            ans = i
        }
        i += 1
    }
    return ans
}
func returnResult(a: Double) -> Any {
    if a.truncatingRemainder(dividingBy: 1) == 0{
        return Int(a)
    } else {
        return a
    }
}
func determineSizeButtons(_ sizeView: CGFloat) -> CGFloat{
    return sizeView/5
}
struct Sizes{
    var sizeButton = CGFloat()
    var sizeSpace = CGFloat()
    var sizeDivide = CGFloat()
    
    init(){
        sizeButton = 80
        sizeSpace = 14
        sizeDivide = 100
    }
    
    init(_ sizeW: CGFloat,_ sizeH: CGFloat){
        sizeButton = determineSizeButtons(sizeW)
        sizeSpace = sizeButton/5
        sizeDivide = sizeH - sizeButton*7
    }
}

