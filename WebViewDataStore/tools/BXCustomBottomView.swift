//
//  BXCustomBottomView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/19.
//

import UIKit

class BXCustomBottomView: UIView {

    let whiteView = UIView()
    let pickerView = UIPickerView()
    var selectBlock: ((String) -> (Void))?
    
    var datas: [String]? {
        didSet {
            selectString = datas?.first
            pickerView.reloadComponent(0)
        }
    }
    
    private let contentH: CGFloat = 320
    private var selectString: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func showView() {
        UIView.animate(withDuration: 1.0) {
            self.alpha = 0.6
            var tFrame = self.whiteView.frame
            tFrame.origin.y = kScreenH - self.contentH
            self.whiteView.frame = tFrame
        }
    }
    func hideView() {
        UIView.animate(withDuration: 1.0) {
            self.alpha = 0.0
            var tFrame = self.whiteView.frame
            tFrame.origin.y = kScreenH
            self.whiteView.frame = tFrame
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        hideView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.black
        self.alpha = 0.0
        AppConstant.keyWindow?.addSubview(self)
        AppConstant.keyWindow?.addSubview(whiteView)
        
        whiteView.frame = CGRect(x: 0, y: kScreenH, width: kScreenW, height: contentH)
        let cornerLayer = CAShapeLayer()
        let path = UIBezierPath(roundedRect: whiteView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 15, height: 15))
        cornerLayer.path = path.cgPath
        cornerLayer.fillColor = UIColor.white.cgColor
        whiteView.layer.addSublayer(cornerLayer)
        
        whiteView.addSubview(pickerView)
        pickerView.frame = CGRect(x: 0, y: 20, width: kScreenW, height: 200)
        pickerView.dataSource = self
        pickerView.delegate = self
        
        let buttonW = kScreenW/2 - 60 - 10
        let buttonH: CGFloat = 40
        let cancelButton = UIButton(type: .custom)
        cancelButton.frame = CGRect(x: 60, y: pickerView.bx_maxY + 20, width: buttonW, height: buttonH)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.backgroundColor = .gray
        cancelButton.setTitleColor(.green, for: .normal)
        whiteView.addSubview(cancelButton)
        cancelButton.tag = 1
        cancelButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        cancelButton.layer.cornerRadius = 8
        
        let sureButton = UIButton(type: .custom)
        sureButton.frame = CGRect(x: cancelButton.bx_maxX + 20, y: pickerView.bx_maxY + 20, width: buttonW, height: buttonH)
        sureButton.setTitle("确定", for: .normal)
        sureButton.backgroundColor = .green
        sureButton.setTitleColor(.white, for: .normal)
        whiteView.addSubview(sureButton)
        sureButton.tag = 2
        sureButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        sureButton.layer.cornerRadius = 8
    }
    
    @objc private func buttonClick(sender: UIButton) {
        hideView()
        if sender.tag == 2 {
            if let selectBlock = selectBlock {
                selectBlock(self.selectString ?? "")
            }
        }
    }
}

extension BXCustomBottomView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let datas = datas {
            return datas[row]
        }
        return "\(row)==\(component)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
