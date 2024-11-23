//
//  BXCustomMenuView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/20.
//

import UIKit

class BXCustomMenuView: UIView {

    let BXCMenuCellID = "BXCMENUCELLID"
    let BXCCommonCellID = "BXCCOMMONCELLID"
    lazy var collectionView: UICollectionView = {
        
        let itemW = (kScreenW - 12*4)/5
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemW, height: itemW + 5)
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.blue
        collection.dataSource = self
        collection.delegate = self
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
//        collection.contentInset = .init(top: 0, left: 12, bottom: 0, right: 12)
//        collection.contentInsetAdjustmentBehavior = .never
//        if #available(iOS 13.0, *) {
//            collection.automaticallyAdjustsScrollIndicatorInsets = false
//        } else {
//            // Fallback on earlier versions
//        }
        return collection
    }()
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = CGRect(x: 12, y: 0, width: self.bx_width - 12, height: self.bx_height)
        
        circleView.frame = CGRect(x: self.bx_width/2 - 30, y: collectionView.bx_maxY - 15, width: 60, height: 8)
    }
}

extension BXCustomMenuView {
    private func setupSubview() {
        addSubview(collectionView)
        collectionView.register(BXMenuCell.self, forCellWithReuseIdentifier: BXCMenuCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: BXCCommonCellID)

        addSubview(circleView)
    }
}

extension BXCustomMenuView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row > 12 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BXCCommonCellID, for: indexPath)
            return cell
        }
        let cell: BXMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: BXCMenuCellID, for: indexPath) as! BXMenuCell
        return cell
    }
}




class BXMenuCell: UICollectionViewCell {
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let menuX = self.bx_width/2 - 20
        menuImage.frame = CGRect(x: menuX, y: 0, width: 40, height: 40)
        menuLabel.frame = CGRect(x: 0, y: menuImage.bx_maxY, width: self.bx_width, height: self.bx_height - menuImage.bx_maxY)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
