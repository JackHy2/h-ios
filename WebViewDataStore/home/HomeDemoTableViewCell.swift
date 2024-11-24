//
//  HomeDemoTableViewCell.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/24.
//

import UIKit

class HomeDemoTableViewCell: UITableViewCell {

    private var cellImageView: UIImageView
    private var imageLabelBackView: UIView
    private var imageLabel: UILabel
    private var cellTitleLabel: UILabel
    private var contentTitleLabel: UILabel
    private var visitDayLabel: UILabel
    private var distanceButton: UIButton
    private var backGrayView: UIView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        cellImageView = UIImageView()
        cellImageView.backgroundColor = .red
        cellImageView.layer.cornerRadius = 4
        imageLabelBackView = UIView()
        imageLabelBackView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        imageLabel = UILabel()
        imageLabel.text = "本月5访"
        imageLabel.textColor = .white
        cellTitleLabel = UILabel()
        cellTitleLabel.text = "海悦华府自营店"
        
        contentTitleLabel = UILabel()
        contentTitleLabel.text = "地址：河南省郑州市世贸大厦世贸大厦世贸大"
        visitDayLabel = UILabel()
        visitDayLabel.text = "拜访中"
        distanceButton = UIButton(type: .custom)
        distanceButton.setTitle("距离2km", for: .normal)
        
        backGrayView = UIView()
        backGrayView.backgroundColor = UIColor.purple
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(cellImageView)
        cellImageView.addSubview(imageLabelBackView)
        cellImageView.addSubview(imageLabel)
        contentView.addSubview(cellTitleLabel)
        
        contentView.addSubview(contentTitleLabel)
        contentView.addSubview(visitDayLabel)
        contentView.addSubview(distanceButton)
        contentView.addSubview(backGrayView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.frame = CGRect(x: 16, y: 12, width: 80, height: 80)
        imageLabelBackView.frame = CGRect(x: 0, y: 62, width: 44, height: 18)
        imageLabel.frame = CGRect(x: 0, y: 62, width: 44, height: 18)
        cellTitleLabel.frame = CGRect(x: cellImageView.bx_maxX + 12, y: 12, width: 180, height: 24)
        contentTitleLabel.frame = CGRect(x: cellTitleLabel.bx_x, y: cellTitleLabel.bx_maxY + 25, width: 200, height: 22)
        visitDayLabel.frame = CGRect(x: kScreenW - 116, y: 14, width: 100, height: 20)
        distanceButton.frame = CGRect(x: kScreenW - 80, y: 86, width: 64, height: 28)
        backGrayView.frame = CGRect(x: 0, y: 122, width: bx_width, height: 8)
        
        
        roundCornersSet(view: imageLabelBackView, corners: [.topRight, .bottomLeft], radius: 4)
    }
}


func roundCornersSet(view: UIView, corners: UIRectCorner, radius: CGFloat) {
    let shaperLayer = CAShapeLayer()
    shaperLayer.frame = view.bounds
    shaperLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
    view.layer.mask = shaperLayer
}
