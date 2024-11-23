//
//  BXCustomTextImageView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/15.
//

import UIKit

class BXCustomTextImageView: UIView {

    private let textLabel = UILabel()
    private let imageView = UIImageView()
    var tapBlock: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(textLabel)
        addSubview(imageView)
        textLabel.text = "ABCDEFG"
        imageView.image = UIImage(named: "arrow_down_icon")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureClick))
        self.addGestureRecognizer(tapGesture)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let selfW = self.frame.width, selfH = self.frame.height
        textLabel.frame = CGRect(x: 0, y: 0, width: selfW - 45, height: selfH)
        imageView.frame = CGRect(x: selfW - 30, y: selfH/2 - 15, width: 30, height: 30)
    }
    
    @objc private func tapGestureClick() {
        if let tapBlock = tapBlock {
            tapBlock()
        }
    }
}
