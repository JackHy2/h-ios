//
//  BXProtocolAlertView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/14.
//

import UIKit

class BXProtocolAlertView: UIView {

    static func showAlertView(view: UIView) {
        if !view.isHidden { return }
        view.isHidden = false
        //3s后隐藏
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute:{
            view.isHidden = true
        })
    }
    
    private let backView = UIView()
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // Storyboard/XIB 启用
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        addSubview(backView)
        addSubview(textLabel)
        
        isHidden = true
        
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        backView.layer.cornerRadius = 5
        textLabel.text = "请阅读并勾选上方协议"
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 14)
        textLabel.textColor = .white
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        backView.frame = CGRect(x: 0, y: 10, width: rect.width, height: rect.height - 10)
        textLabel.frame = backView.frame
        
        let point1 = CGPoint(x: 5, y: 10)
        let point2 = CGPoint(x: 10, y: 0)
        let point3 = CGPoint(x: 15, y: 10)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: point1)
        bezierPath.addLine(to: point2)
        bezierPath.addLine(to: point3)
        
        let shaperLayer = CAShapeLayer()
        shaperLayer.path = bezierPath.cgPath
        layer.addSublayer(shaperLayer)
        shaperLayer.fillColor = UIColor.black.withAlphaComponent(0.6).cgColor
    }
}
