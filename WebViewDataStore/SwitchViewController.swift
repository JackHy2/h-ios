//
//  SwitchViewController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/11.
//

import UIKit

class SwitchViewController: UIViewController {
    
    private var alertView: BXAlertMiddleView?
    
    private let UITableViewCellID = "UITableViewCellID"
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        alertView = BXAlertMiddleView()
        
        let gradientView = GradientView()
        gradientView.frame = CGRect(x: 10, y: 120, width: 100, height: 30)
        view.addSubview(gradientView)
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCellID)
        tableView.frame = CGRectMake(0, gradientView.bx_maxY + 10, view.bx_width, view.bx_height - gradientView.bx_maxY - 30)
    }
}

extension SwitchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellID, for: indexPath)
        cell.textLabel?.text = "INDEX: \(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(MineViewController(), animated: true)
            break
        case 1:
            navigationController?.pushViewController(BXWebViewController(), animated: true)
            break
        case 2:
            navigationController?.pushViewController(TestOneViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(HomeDemoViewController(), animated: true)
        case 4:
            alertView?.buttonTapBlock = {tag in print("out in: \(tag)")}
            alertView?.show()
        default: break
        }
    }
}



/// 自定义 登录协议 控件
class ProtocolCommonView: UIView {
    private let statusView: UIButton = UIButton(type: .custom)
    private let protocolLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // 支持使用Storyboard和XIB
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setupView() {
        //配置视图属性 如背景色、边框
    }
}

/// 渐变view
class GradientView: UIView {
    // 重写draw(_:)方法来自定义视图的外观
    override func draw(_ rect: CGRect) {
//        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        let colors = [UIColor.red.cgColor, UIColor.purple.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: rect.height)
        
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: [])
    }
}


