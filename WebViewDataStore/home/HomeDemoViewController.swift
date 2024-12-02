//
//  HomeDemoViewController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/20.
//

import UIKit

class HomeDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH), style: .plain)
        tableView.backgroundColor = UIColor.cyan
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        view.addSubview(tableView)
        tableView.register(HomeDemoTableViewCell.self, forCellReuseIdentifier: "HomeDemoCellID")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 80))
        headerView.backgroundColor = .blue
        tableView.tableHeaderView = headerView
    }
}

extension HomeDemoViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDemoCellID", for: indexPath) as! HomeDemoTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 100))
        view.backgroundColor = .white
        let textLabel = UILabel(frame: CGRect(x: 10, y: 0, width: kScreenW - 90, height: 50))
        let attriString = "(计划1/8 总拜访1)"
        let attribute = NSMutableAttributedString(string: "测试20240712(计划1/8 总拜访1)")
        attribute.addAttributes([.font: UIFont.systemFont(ofSize: 10), .foregroundColor: UIColor.black.withAlphaComponent(0.35)], range: NSRange(location: attribute.length - attriString.count, length: attriString.count))
        textLabel.font = UIFont.systemFont(ofSize: 12)
        textLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        textLabel.attributedText = attribute
        view.addSubview(textLabel)
        
        let checkoutView = BXCustomTextImageView(frame: CGRect(x: kScreenW - 70, y: 0, width: 70, height: 50))
        view.addSubview(checkoutView)
        
        let buttonTexts = ["线内", "线外"]
        for (i,str) in buttonTexts.enumerated() {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 10 + 58*i, y: 63, width: 50, height: 24)
            btn.setTitle(str, for: .normal)
            btn.backgroundColor = .lightGray
            btn.layer.cornerRadius = 12
            view.addSubview(btn)
        }
        
        let rightImages = ["筛", "图"]
        // 12 16 10 16   8 16 8  28*28  6 + 28 + 28 + 10
        for (i, str) in rightImages.enumerated() {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 393 - 6 - 28*2 - 10 + 28*i, y: 50 + 11, width: 28, height: 28)
            btn.setTitle(str, for: .normal)
            btn.backgroundColor = .lightGray
            view.addSubview(btn)
        }
        
        let inputName = UITextField(frame: CGRect(x: 10 + 50*2 + 20, y: 59, width: kScreenW - 10 - 50*2 - 20 - 12 - 28*2 - 10, height: 32))
        inputName.borderStyle = .none
        inputName.backgroundColor = UIColor.hexColorInt(hex: 0xAAADAE)
        inputName.layer.cornerRadius = 16
        inputName.placeholder = "请输入终端名称"
        view.addSubview(inputName)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}
