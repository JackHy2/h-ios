//
//  UIColor+Extension.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/14.
//

import UIKit

extension UIColor {
    
    static func hexColor(color: String) {
//        if color.hasPrefix("0x") {
//            
//            UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
//        }
//        if color.hasPrefix("#") {
//            
//        }
    }
    
    static func hexColorInt(hex: Int, alp: CGFloat = 1.0) -> UIColor {
        return UIColor(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alp)
    }
}
