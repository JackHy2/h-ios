//
//  BXWebViewController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/15.
//

import UIKit
import WebKit

class BXWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configUI()
    }
}

extension BXWebViewController {
    
    private func configUI() {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        view.addSubview(webView)
        webView.frame = CGRect(x: 0, y: kNaviBarH, width: kScreenW, height: kScreenH - kNaviBarH - kTabBarH)
        webView.navigationDelegate = self
        
        let urlRequest = URLRequest(url: URL(string: protocolUrl)!)
        webView.load(urlRequest)
    }
}

extension BXWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 改变网页内容背景颜色
//        webView.evaluateJavaScript("document.getElementsByTagName('body')[0].style.background='#ffffff'")
        // 改变网页内容文字颜色
//        webView.evaluateJavaScript("document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#000'")
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
//            webView.
//        })
    }
}
