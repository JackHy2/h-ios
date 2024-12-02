//
//  UIView+Extension.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/13.
//

import UIKit


extension UIView {
    var bx_x: CGFloat {
        get{
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    var bx_y: CGFloat {
        get{
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    var bx_width: CGFloat {
        get{
            return frame.width
        }
        set(newValue) {
            var tempFrame = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    var bx_height: CGFloat {
        get{
            return frame.height
        }
        set(newValue) {
            var tempFrame = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    var bx_maxX: CGFloat {
        get{
            return bx_x + bx_width
        }
        set(newValue) {
            bx_x = newValue - bx_width
        }
    }
    var bx_maxY: CGFloat {
        get{
            return bx_y + bx_height
        }
        set(newValue) {
            bx_y = newValue - bx_height
        }
    }
//    var bx_centerX: CGFloat {
//        get{
//            return bx_width / 2
//        }
//        set(newValue) {
//            var tempFrame = frame
//            tempFrame.origin.x = newValue
//            frame = tempFrame
//        }
//    }
//    var bx_centerY: CGFloat {
//        get{
//            return frame.origin.x
//        }
//        set(newValue) {
//            var tempFrame = frame
//            tempFrame.origin.x = newValue
//            frame = tempFrame
//        }
//    }
}

extension UIView {
    /// 渐变色
    func addGradientLayer(colors: [CGColor], locations: [CGPoint], rect: CGRect) -> CALayer {
        let layer = CAGradientLayer()
        layer.frame = rect
        layer.colors = colors
        layer.startPoint = locations.first ?? .zero
        layer.endPoint = locations.last ?? .zero
        return layer
    }
    
    func addCornerRadius(corners: UIRectCorner, radius: CGFloat = 5) {
        let shaperLayer = CAShapeLayer()
        shaperLayer.frame = bounds
        shaperLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        layer.mask = shaperLayer
    }
}
