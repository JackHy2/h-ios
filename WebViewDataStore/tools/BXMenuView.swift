//
//  BXMenuView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/20.
//

import UIKit

class BXMenuView: UIView {

    var showCount: Int? {
        didSet {
            setContentView()
        }
    }
    
    lazy var mScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    lazy var circleView: BXCustomCircleView = {
        let view = BXCustomCircleView()
        return view
    }()
    
    // 单页显示个数
    private let itemCount = 5
    // item间距
    private let tempX = 12.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mScrollView)
        mScrollView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let tFrame = CGRect(x: tempX, y: 0, width: self.bx_width - tempX, height: self.bx_height)
        mScrollView.frame = tFrame
    }
    
//    func scrollViewAnimation(index: Int){
//        mScrollView.setContentOffset(CGPoint(x: mScrollView.bx_width*1.0, y: 0), animated: true)
//    }
}

extension BXMenuView {
    
    private func setContentView() {
        
        mScrollView.subviews.forEach { $0.removeFromSuperview() }
        guard let showCount = showCount else { return }
        
        let tempWidth = self.bx_width - tempX
        let itemW = tempWidth/CGFloat(itemCount) - tempX
        for i in 0..<showCount {
            let view = SingleMenuView(frame: CGRect(x: (tempX + itemW)*CGFloat(i), y: 16, width: itemW, height: itemW + 4))
            mScrollView.addSubview(view)
        }
        
        let rightView = UIView(frame: CGRect(x: self.bx_width - tempX, y: 0, width: tempX, height: self.bx_height))
        rightView.backgroundColor = .white
        addSubview(rightView)
        
        let lastCount: CGFloat = CGFloat(showCount / 5 + (showCount % 5 > 0 ? 1 : 0))
        if lastCount > 1 {
            mScrollView.contentSize = CGSize(width: tempWidth * lastCount, height: 0)
            addSubview(circleView)
            circleView.frame = CGRect(x: 0, y: self.bx_height - 26, width: self.bx_width, height: 26)
            circleView.setCircleCount(Int(lastCount))
//            circleView.tapBlock = {[weak self] index in
//                
//                guard let scrollView = self?.mScrollView else { return }
//                scrollView.setContentOffset(CGPoint(x: scrollView.bx_width*CGFloat(index), y: 0), animated: true)
//            }
        }
    }
}

extension BXMenuView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x / scrollView.bx_width
        circleView.setCircleSelectIndex(Int(offsetX))
    }
}





class SingleMenuView: UIView {
    
    let menuImage = UIImageView()
    let menuLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(menuImage)
        menuImage.image = UIImage(named: "menu_icon")

        addSubview(menuLabel)
        menuLabel.textAlignment = .center
        menuLabel.text = "我的终端"
        menuLabel.font = .systemFont(ofSize: 12)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let menuX = self.bx_width/2 - 20
        menuImage.frame = CGRect(x: menuX, y: 0, width: 40, height: 40)
        menuLabel.frame = CGRect(x: 0, y: menuImage.bx_maxY, width: self.bx_width, height: self.bx_height - menuImage.bx_maxY)
    }
}
    
