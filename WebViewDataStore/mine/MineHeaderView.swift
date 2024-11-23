//
//  MineHeaderView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/14.
//

import UIKit

//class MineHeaderView: UITableViewHeaderFooterView {
class MineHeaderView: UIView {

    private let gradualView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradualView.frame = frame
        let glayer = CAGradientLayer()
        glayer.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 168)
        glayer.colors = [UIColor.hexColorInt(hex: 0xFF6734).cgColor, UIColor.hexColorInt(hex: 0xFF9F62).cgColor]
        glayer.startPoint = CGPoint(x: 0, y: 0.5)
        glayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(glayer)
        
        let titleLabel = UILabel()
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: kSafeTop, width: kScreenW, height: 44)
        titleLabel.text = "我的"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        
        let headImageView = UIImageView(frame: CGRect(x: 20, y: titleLabel.bx_maxY, width: 68, height: 68))
        headImageView.image = UIImage(named: "")
        headImageView.backgroundColor = .blue
        headImageView.layer.cornerRadius = 34
        headImageView.layer.masksToBounds = true
        addSubview(headImageView)
    
        let nameLabel = UILabel(frame: CGRect(x: headImageView.bx_maxX + 12, y: titleLabel.bx_maxY + 9, width: 0, height: 28))
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.text = "李意礼"
        nameLabel.textColor = .white
        addSubview(nameLabel)
        nameLabel.sizeToFit()
        nameLabel.frame = CGRect(x: headImageView.bx_maxX + 12, y: titleLabel.bx_maxY + 9, width: nameLabel.bx_width, height: 28)
        
        let roleButton = UIButton(type: .custom)
        roleButton.frame = CGRect(x: nameLabel.bx_maxX + 8, y: titleLabel.bx_maxY + 11, width: 0, height: 25)
        roleButton.backgroundColor = .white
        roleButton.layer.cornerRadius = 12.5
        roleButton.setTitle("经销商访销员 ∇", for: .normal)
        roleButton.setTitleColor(UIColor.hexColorInt(hex: 0xFF6633), for: .normal)
        roleButton.titleLabel?.font = .systemFont(ofSize: 12)
        addSubview(roleButton)
        roleButton.sizeToFit()
        roleButton.frame = CGRect(x: nameLabel.bx_maxX + 8, y: titleLabel.bx_maxY + 11, width: roleButton.bx_width + 8, height: 25)
        
        let descripLabel = UILabel(frame: CGRect(x: nameLabel.bx_x, y: nameLabel.bx_maxY + 4, width: kScreenW - nameLabel.bx_x - 20, height: 17))
        addSubview(descripLabel)
        descripLabel.text = "河南郑州永翔顺经销商"
        descripLabel.textColor = .white
        descripLabel.font = .systemFont(ofSize: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
