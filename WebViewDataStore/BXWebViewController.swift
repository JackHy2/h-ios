//
//  BXWebViewController.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/12/2.
//

import UIKit
import WebKit

class BXWebViewController: UIViewController {

    lazy var webView = {
        let config = WKWebViewConfiguration()
//        config.websiteDataStore = WKWebsiteDataStore.default()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.backgroundColor = .brown
        webView.navigationDelegate = self
        webView.uiDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(webView)
        webView.frame = CGRect(origin: .zero, size: CGSize(width: kScreenW, height: kScreenH - kNaviBarH - kTabBarH))
//        let urlRequest = URLRequest(url: URL(string: "https://www.baidu.com")!, cachePolicy: .returnCacheDataElseLoad)
        let urlRequest = URLRequest(url: URL(string: "https://wgt-sit.bxys.cc/#/")!, cachePolicy: .returnCacheDataElseLoad)
        webView.load(urlRequest)
    }
}

extension BXWebViewController: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
       // let requestUrlStr = navigationAction.request.url?.absoluteString
        //需要判断targetFrame是否为nil，如果为空则重新请求
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if (navigationAction.targetFrame == nil) {
            webView.load(navigationAction.request)
        }
        return nil
    }

}
