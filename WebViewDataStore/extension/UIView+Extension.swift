//
//  UIView+Extension.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/13.
//

import UIKit


extension UIView {
    var bx_x: CGFloat {
        return CGRectGetMinX(frame)
    }
    var bx_y: CGFloat {
        return CGRectGetMinY(frame)
    }
    var bx_maxX: CGFloat {
        return CGRectGetMaxX(frame)
    }
    var bx_maxY: CGFloat {
        return CGRectGetMaxY(frame)
    }
    var bx_width: CGFloat {
        return CGRectGetWidth(frame)
    }
    var bx_height: CGFloat {
        return CGRectGetHeight(frame)
    }
}

extension UIView {
    func addGradientLayer(colors: [CGColor], locations: [CGPoint], rect: CGRect) -> CALayer {
        let layer = CAGradientLayer()
        layer.frame = rect
        layer.colors = colors
        layer.startPoint = locations.first ?? .zero
        layer.endPoint = locations.last ?? .zero
        return layer
    }
}
