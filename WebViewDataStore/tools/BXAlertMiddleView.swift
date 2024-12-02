//
//  BXAlertMiddleView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/12/2.
//

import UIKit

class BXAlertMiddleView {
    
    var buttonTapBlock: (_ tag: Int) -> Void = {_ in }
    
    var titleLabel: UILabel?
    var subTitleLabel: UILabel?
    var leftButton: UIButton?
    var rightButton: UIButton?
    
    private var backView: UIView?
    private var contentView: UIView?
    
    init() {
        contentSubview()
    }
    
    func show() {
        backView?.bx_y = 0
        contentView?.bx_y = kScreenH/2 - 80
        UIView .animate(withDuration: 0.5) {
            self.backView?.alpha = 0.3
            self.contentView?.alpha = 1.0
        }
    }
    
    func hide() {
        UIView .animate(withDuration: 0.5) {
            self.backView?.alpha = 0.0
            self.contentView?.alpha = 0.0
        } completion: { _ in
            self.backView?.bx_y = kScreenH
            self.contentView?.bx_y = kScreenH
        }
    }
    
    @objc private func buttonClick(sender: UIButton) {
        hide()
        print("tag: \(sender.tag)")
        buttonTapBlock(sender.tag)
    }
    
    private func contentSubview() {
        backView = UIView(frame: CGRect(x: 0, y: kScreenH, width: kScreenW, height: kScreenH))
        backView?.backgroundColor = .black
        backView?.alpha = 0.0
//        AppConstant.keyWindow?.addSubview(backView!)
        tempKeyWindow?.addSubview(backView!)
        
        contentView = UIView(frame: CGRect(x: 30, y: kScreenH, width: kScreenW - 60, height: 160))
        contentView?.backgroundColor = .white
        contentView?.alpha = 0.0
        contentView?.layer.cornerRadius = 8
//        AppConstant.keyWindow?.addSubview(contentView!)
        tempKeyWindow?.addSubview(contentView!)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: contentView!.bx_width, height: 25))
        titleLabel?.text = "提示"
        titleLabel?.textAlignment = .center
        titleLabel?.font = .systemFont(ofSize: 16)
        contentView?.addSubview(titleLabel!)
        
        subTitleLabel = UILabel(frame: CGRect(x: 20, y: titleLabel!.bx_maxY + 15, width: contentView!.bx_width - 40, height: 50))
        subTitleLabel?.text = "终端\"休闲鞋的fisn11\"拜访尚未完成，请确认是否继续"
        subTitleLabel?.textAlignment = .center
        subTitleLabel?.font = .systemFont(ofSize: 16)
        subTitleLabel?.textColor = .hexColorInt(hex: 0x999999)
        subTitleLabel?.numberOfLines = 2
        contentView?.addSubview(subTitleLabel!)
        
        let verticalLine = UIView(frame: CGRect(x: 0, y: contentView!.bx_height - 45.5, width: contentView!.bx_width, height: 0.5))
        verticalLine.backgroundColor = .red
        contentView?.addSubview(verticalLine)
        
        leftButton = UIButton(type: .custom)
        leftButton?.frame = CGRect(x: 0, y: contentView!.bx_height - 45, width: contentView!.bx_width/2, height: 45)
        leftButton?.setTitle("放弃拜访", for: .normal)
        leftButton?.setTitleColor(.blue, for: .normal)
        contentView?.addSubview(leftButton!)
        leftButton?.tag = 1
        leftButton?.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        rightButton = UIButton(type: .custom)
        rightButton?.frame = CGRect(x: leftButton!.bx_maxX, y: contentView!.bx_height - 45, width: contentView!.bx_width/2, height: 45)
        rightButton?.setTitle("继续拜访", for: .normal)
        rightButton?.setTitleColor(.systemBlue, for: .normal)
        contentView?.addSubview(rightButton!)
        rightButton?.tag = 2
        rightButton?.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        let horizonalLine = UIView(frame: CGRect(x: contentView!.bx_width/2 - 0.5, y: contentView!.bx_height - 45, width: 0.5, height: 45))
        horizonalLine.backgroundColor = .red
        contentView?.addSubview(horizonalLine)
    }
}


let tempKeyWindow = {
    
    if #available(iOS 13.0, *) {
        return UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundActive}
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    } else {
        return UIApplication.shared.keyWindow
    }
}()
