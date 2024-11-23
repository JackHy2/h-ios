//
//  MineViewController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/14.
//

import UIKit

class MineViewController: UIViewController {

    private let MineTableViewCellID = "MineTableViewCellID"
    private lazy var tableView = {
        let table = UITableView()
        table.rowHeight = 56
        table.separatorStyle = .none
        return table
    }()
    private let exitButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 8, width: kScreenW - 32, height: 40)
        button.setTitle("退出登录", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        let layer = CAGradientLayer()
        layer.frame = button.bounds
        layer.colors = [UIColor.hexColorInt(hex: 0xFF9F62).cgColor, UIColor.hexColorInt(hex: 0xFF6633).cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 0)
        button.layer.addSublayer(layer)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()
    
    private var titles = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        configView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension MineViewController {
    private func configView(){
                
        titles = ["消息", "终端陈列数据", "扫一扫", "账户余额", "邀请终端门店记录", "我的二维码", "产品收藏夹", "支付设置", "我的打印机", "数据同步"]
        
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.hexColorInt(hex: 0xf6f6f6)
        tableView.frame = CGRect(x: 0, y: 0, width: view.bx_width, height: view.bx_height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MineTableCell.self, forCellReuseIdentifier: MineTableViewCellID)

        let headerView = MineHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 168))
        tableView.tableHeaderView = headerView
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 56))
        footerView.addSubview(exitButton)
        exitButton.addTarget(self, action: #selector(exitButtonClick), for: .touchUpInside)
        tableView.tableFooterView = footerView
        
        if #available(iOS 13.0, *) {
            tableView.automaticallyAdjustsScrollIndicatorInsets = false
        }
        tableView.contentInsetAdjustmentBehavior = .never
    }
}

extension MineViewController {
    
    @objc private func exitButtonClick(){
        
    }
}

extension MineViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MineTableViewCellID, for: indexPath) as! MineTableCell
        cell.titleLabel?.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            navigationController?.popViewController(animated: true)
            break
        default:
            break
        }
    }
}

