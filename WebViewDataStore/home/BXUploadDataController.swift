//
//  BXUploadDataController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/12/2.
//

import UIKit

class BXUploadDataController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.rowHeight = 75
        table.separatorStyle = .none
//        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "数据同步"
        setupUI()
    }
}

extension BXUploadDataController {
    private func initData() {
        
    }
    private func setupUI() {
        view.addSubview(tableView)
    }
}
