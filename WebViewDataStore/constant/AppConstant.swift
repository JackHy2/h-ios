//
//  AppConstant.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/11.
//

import UIKit

let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height

//let kSafeTop = UIApplication.shared.keyWindow?.safeAreaInsets.top
//let kSafeBottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
//
//let kNaviBarH = 88
//let kTabBarH = 49 + 34

//@available(iOS 13.0, *)
//let keyWindow = UIApplication.shared.connectedScenes
//    .filter {$0.activationState == .foregroundActive}
//    .map({$0 as? UIWindowScene})
//    .compactMap({$0})
//    .first?.windows
//    .filter({$0.isKeyWindow}).first
//
//@available(iOS 13.0, *)
//let kSafeTop = keyWindow?.safeAreaInsets.top
//@available(iOS 13.0, *)
//let kSafeBottom = keyWindow?.safeAreaInsets.bottom
//
//@available(iOS 13.0, *)
//let kNaviBarH = (kSafeTop ?? 20) + 44
//@available(iOS 13.0, *)
//let kTabBarH = (kSafeBottom ?? 0) + 49

enum AppConstant {
    
    case tit
    case que
    
    
    static let keyWindow = {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter {$0.activationState == .foregroundActive}
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        } else {
            return UIApplication.shared.keyWindow
        }
    }()
    
//    static let kSafeTop = keyWindow?.safeAreaInsets.top ?? 20
//    static let kSafeBottom = keyWindow?.safeAreaInsets.bottom ?? 0
//    static let kNaviBarH = kSafeTop + 44
//    static let kTabBarH = kSafeBottom + 49
    
//    static let kScaleX(value){
//        return 375/kScreenW
//    }
}

let kSafeTop = AppConstant.keyWindow?.safeAreaInsets.top ?? 20
let kSafeBottom = AppConstant.keyWindow?.safeAreaInsets.bottom ?? 0
let kNaviBarH = kSafeTop + 44
let kTabBarH = kSafeBottom + 49

func kScaleX(_ value: CGFloat) -> CGFloat {
    return (kScreenW/375.0)*value
}
// 812
func kScaleY(_ value: CGFloat) -> CGFloat {
    return (kScreenH/667.0)*value
}
func kScaleFont(_ value: CGFloat) -> CGFloat {
    return (kScreenW/375.0)*value
}

let protocolUrl = "https://wgt-sit.bxys.cc/assets/index-414af60d.js#/pages/bxtPrivacyAgreement/index"
