//
//  BXProtocolView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/13.
//

import UIKit


class BXProtocolView: UIView {
    
    var isSelected = false
    var protocolClick: ()->Void = {}
    
    private let iconIV = UIImageView()
    private let frontLabel = UILabel()
    private let attriLabel = UILabel()
    private let selectButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        addSubview(iconIV)
        addSubview(frontLabel)
        addSubview(attriLabel)
        addSubview(selectButton)
        
        iconIV.layer.cornerRadius = 10
        iconIV.layer.borderWidth = 1
        iconIV.layer.borderColor = UIColor.red.cgColor
        
        frontLabel.text = "我已阅读并同意"
        frontLabel.font = UIFont.systemFont(ofSize: 14)
        attriLabel.text = "《服务协议与隐私条款》"
        attriLabel.textColor = UIColor.orange
        attriLabel.font = UIFont.systemFont(ofSize: 14)
        attriLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(attriTextTapGesture))
        attriLabel.addGestureRecognizer(tapGesture)
        
        selectButton.addTarget(self, action: #selector(selectButtonClick), for: .touchUpInside)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let sheight = self.bx_height
        iconIV.frame = CGRect(x: 0, y: sheight/2 - 10, width: 20, height: 20)
        
        frontLabel.sizeToFit()
        attriLabel.sizeToFit()
        let frontWidth = frontLabel.bx_width
        let attriWidth = attriLabel.bx_width
        frontLabel.frame = CGRect(x: iconIV.bx_maxX + 5, y: 0, width: frontWidth, height: sheight)
        attriLabel.frame = CGRect(x: frontLabel.bx_maxX, y: 0, width: attriWidth, height: sheight)
        selectButton.frame = CGRect(x: iconIV.bx_x, y: 0, width: frontLabel.bx_maxX, height: sheight)
    }
    
    @objc private func attriTextTapGesture(){
        print("attribute text....")
        protocolClick()
    }
    
    @objc private func selectButtonClick(sender: UIButton){
        sender.isSelected = !sender.isSelected
        isSelected = sender.isSelected
        if isSelected {
            iconIV.image = UIImage(named: "protocol_icon_selected")
            iconIV.layer.borderWidth = 0
        } else {
            iconIV.image = UIImage(named: "")
            iconIV.layer.borderWidth = 1
        }
        print("select.....\(sender.isSelected)")
    }
}


/// 测试1 处理touch事件，获取点击到了第几个字符 - 不准
//class BXProtocolView: UILabel {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.isUserInteractionEnabled = true
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.isUserInteractionEnabled = true
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else {
//            return
//        }
//
//        let point = touch.location(in: self)
//
//
//        let index = characterIndex(at: point)
//
//        print("click index: === \(index ?? 999)")
//    }
//
//    private func characterIndex(at point: CGPoint) -> Int? {
//        guard let attri = self.attributedText else { return nil }
//        let textStorage = NSTextStorage(attributedString: attri)
//        let layoutManager = NSLayoutManager()
//        textStorage.addLayoutManager(layoutManager)
//
//        let textContainer = NSTextContainer(size: self.bounds.size)
//        textContainer.lineFragmentPadding = 0
//        layoutManager.addTextContainer(textContainer)
//
//        let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//        return index
//    }
//}

/// 测试1 添加tapGesture，获取点击到了第几个字符 - 无用
//class BXProtocolView: UIView {
//
//    private var allText: String = ""
//    private var attriText: String = ""
////    "我已阅读并同意《服务协议与隐私条款》"
//    private lazy var selectImage = {
//        let imageV = UIImageView()
//        return imageV
//    }()
//    private lazy var textLabel = {
//        let label = UILabel()
//        return label
//    }()
//    override init(frame: CGRect) {
//
//        super.init(frame: frame)
//
//        print("1122233")
//        addSubview(selectImage)
//        addSubview(textLabel)
//
//        selectImage.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
//        selectImage.image = UIImage(named: "protocol_icon_selected")
////        selectImage.contentMode = .scaleAspectFit
//
////        textLabel.frame = CGRect(x: selectImage.bx_maxX, y: 0, width: self.bx_width - selectImage.bx_maxX, height: self.bx_height)
//        textLabel.frame = CGRect(x: selectImage.bx_maxX, y: 0, width: 150, height: 45)
////        textLabel.text =
//        let selectText = "《服务协议与隐私条款》"
//        let attri = NSMutableAttributedString(string: "我已阅读并同意《服务协议与隐私条款》")
//        attri.addAttributes([.foregroundColor: UIColor.red], range: NSMakeRange(attri.length - selectText.count, selectText.count))
//        textLabel.attributedText = attri
//        textLabel.isUserInteractionEnabled = true
//        attri.index(ofAccessibilityElement: <#T##Any#>)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
//        textLabel.addGestureRecognizer(tapGesture)
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//    }
//    convenience init(allText: String, attriText: String) {
//        self.init()
//        self.allText = allText
//        self.attriText = attriText
//    }
//
//    @objc private func tapGesture(gesture: UITapGestureRecognizer) {
//        if let label = gesture.view as? UILabel {
//            let point = gesture.location(in: label)
//            let index = label.index(ofAccessibilityElement: point)
//
//            print("点击了第\(index)个")
//        }
//    }
//
//    /// 禁用storyboard/xib
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    /// 启动storyboard/xib
////    required init?(coder: NSCoder) {
//////        super.init(coder: coder)
////        fatalError()
////    }
//}
