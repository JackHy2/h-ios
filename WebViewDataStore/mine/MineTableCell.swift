//
//  MineTableCell.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/14.
//

import UIKit

class MineTableCell: UITableViewCell {

//    var leftImageView: UIImageView?
    var titleLabel: UILabel?
    var arrowImageView: UIImageView?
    var rightTextLabel: UILabel?
    var bottomLine: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        leftImageView = UIImageView()
        titleLabel = UILabel()
        arrowImageView = UIImageView()
        rightTextLabel = UILabel()
        bottomLine = UIView()
        
//        leftImageView?.image = UIImage(named: "shop_icon")
//        titleLabel?.text = "邀请终端门店记录"
        rightTextLabel?.textAlignment = .right
//        rightTextLabel?.text = "1"
        arrowImageView?.image = UIImage(named: "arrow_icon")
        bottomLine?.backgroundColor = UIColor.hexColorInt(hex: 0xAAADAE, alp: 0.3)
        
//        addSubview(leftImageView!)
        addSubview(titleLabel!)
        addSubview(arrowImageView!)
        addSubview(rightTextLabel!)
        addSubview(bottomLine!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        leftImageView?.frame = CGRect(x: 16, y: 16, width: 24, height: 24)
        titleLabel?.frame = CGRect(x: 16, y: 0, width: 200, height: 56)
        arrowImageView?.frame = CGRect(x: contentView.bx_width - 40, y: 16, width: 24, height: 24)
        rightTextLabel?.frame = CGRect(x: arrowImageView!.bx_x - 78, y: 0, width: 70, height: 56)
        bottomLine?.frame = CGRect(x: 16, y: contentView.bx_height - 0.5, width: contentView.bx_width - 32, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
