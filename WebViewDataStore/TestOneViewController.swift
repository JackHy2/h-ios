//
//  TestOneViewController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/18.
//

import UIKit

class TestOneViewController: UIViewController {

    let menuView = BXMenuView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //circle 12 8 6 = 26
        
        menuView.frame = CGRect(x: 0, y: 150, width: kScreenW, height: 106)
        menuView.showCount = 13
//        menuView.backgroundColor = .lightGray
        view.addSubview(menuView)
        
        let button = UIButton(frame: CGRect(x: 30, y: 280, width: 100, height: 45))
        button.setTitle("click", for: .normal)
        button.setTitleColor(.red, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        let menuView = BXCustomMenuView(frame: CGRect(x: 0, y: button.bx_maxY + 20, width: kScreenW, height: 100))
        view.addSubview(menuView)
    }
    
    @objc private func buttonClick() {
//        menuView.showCount = 8
//        menuView.scrollViewAnimation(index: 0)
        
        // 解归档 操作
        let dic = ["name": "jack", "phone": "13598922345", "age": 28, "roleModel": ["roleName": "jiaoseming", "roleId": "10", "roleDescrip": "jiaoseMiaoShu"]] as [String : Any]
        UserTools.saveData(fileName: "", dic: dic)
        
        let user = UserTools.getData(fileName: "")
        print(user?.name, user?.phone, user?.age, user?.roleModel?.roleName)
    }
}
