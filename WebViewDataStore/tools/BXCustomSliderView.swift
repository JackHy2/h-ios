//
//  BXCustomSliderView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/29.
//

import UIKit

class BXCustomSliderView: UIView {
    
//    private lazy var tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .plain)
//        return table
//    }()
    
    static func siderViewInit() -> UIView {
        let bsView = UIView(frame: CGRect(x: kScreenW, y: 0, width: kScreenW, height: kScreenH))
        return bsView
    }
    
    private var contentView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        alpha = 0.0
        
//        addSubview(tableView)
        contentView.frame = CGRect(x: kScreenW, y: 0, width: kScreenW, height: kScreenH)
        contentView.backgroundColor = .white
        addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showView() {
        
    }
    
    private func setupSubview() {
        
    }
}
