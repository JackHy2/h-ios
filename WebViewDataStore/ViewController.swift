//
//  ViewController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/8.
//

import UIKit

class ViewController: UIViewController {

    
    private let alertView = BXProtocolAlertView()
    private var bottomView: BXCustomBottomView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let nowDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
//        formatter.timeStyle = .long
//        formatter.timeZone = TimeZone(identifier: "Asia/Beijing")
        let nowString = formatter.string(from: nowDate)
        print("==== \(nowString)")
        
        let date1 = NSDate()
        let now1 = formatter.string(from: date1 as Date)
        print("===== \(now1)")
        
        let oneButton = UIButton(type: .custom)
        oneButton.frame = CGRect(x: 0, y: 100, width: kScreenW, height: 45)
        oneButton.setTitle("url 跳转", for: .normal)
        oneButton.backgroundColor = .red
        view.addSubview(oneButton)
        oneButton.tag = 3
        oneButton.addTarget(self, action: #selector(buttonSelectClick), for: .touchUpInside)
                
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: oneButton.bx_maxY, width: 120, height: 40)
        btn.setTitle("next controller", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        
        let pv = BXProtocolView()
        pv.backgroundColor = UIColor.gray
        pv.frame = CGRect(x: 10, y: btn.bx_maxY + 10, width: 320, height: 40)
        view.addSubview(pv)
        pv.protocolClick = {
            print("jump to protocol xxx")
        }
        
        alertView.frame = CGRect(x: 10, y: pv.bx_maxY + 10, width: 180, height: 45)
        view.addSubview(alertView)
        
        let buttonAlert = UIButton(type: .custom)
        buttonAlert.frame = CGRectMake(20, alertView.bx_maxY + 10, 150, 35)
        view.addSubview(buttonAlert)
        buttonAlert.setTitle("show alert view", for: .normal)
        buttonAlert.backgroundColor = .red
        buttonAlert.tag = 2
        buttonAlert.addTarget(self, action: #selector(buttonSelectClick), for: .touchUpInside)
        
        let textImageView = BXCustomTextImageView(frame: CGRect(x: 30, y: buttonAlert.bx_maxY + 10, width: 150, height: 45))
        textImageView.backgroundColor = .lightGray
        textImageView.layer.cornerRadius = 22
        view.addSubview(textImageView)
        textImageView.tapBlock = {
            self.textImageViewClick()
        }
        
        bottomView = BXCustomBottomView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        bottomView?.datas = ["111", "222", "333", "444", "555"]
    }
    
    @objc private func buttonClick() {
        navigationController?.pushViewController(SwitchViewController(), animated: true)
    }
    
    @objc private func buttonSelectClick(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.tag == 2 {
            BXProtocolAlertView.showAlertView(view: alertView)
        } else if sender.tag == 3 {
            // https://beian.miit.gov.cn/#/Integrated/index
            // https://www.baidu.com
            if let url = URL(string: "https://beian.miit.gov.cn/#/Integrated/index"),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    private func textImageViewClick(){
        
        bottomView?.showView()
        
//        let textImageVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        let actionOne = UIAlertAction(title: "AA", style: .default)
//        textImageVC.addAction(actionOne)
//        let actionTwo = UIAlertAction(title: "BB", style: .default)
//        textImageVC.addAction(actionTwo)
//        let actionThree = UIAlertAction(title: "BB", style: .default)
//        textImageVC.addAction(actionThree)
//        let actionFour = UIAlertAction(title: "cancel", style: .cancel)
//        textImageVC.addAction(actionFour)
//        let actionFive = UIAlertAction(title: "sure", style: .destructive) { action in
//
//        }
//        textImageVC.addAction(actionFive)
//
//        present(textImageVC, animated: true)
    }
}

