//
//  WKWebViewController.swift
//  ULSample
//
//  Created by hirauchi.shinichi on 2017/02/08.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKNavigationDelegate {

    var wkWebView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wkWebView = WKWebView()
        self.view = self.wkWebView!
        let url = URL(string:SourceUrl)
        let req = NSURLRequest(url:url!)
        wkWebView!.load(req as URLRequest)
        
        self.navigationItem.title = "WKWebView"
        wkWebView?.navigationDelegate = self
    }


    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url?.absoluteString
        if url == DestinationUrl {
            // UniversalLinksで起動された場合の処理
            let viewController = navigationController?.viewControllers.first as! ViewController
            viewController.openUniversalLinksView(url: url!)
            // NavigationControllerで戻る
            _ = navigationController?.popViewController(animated: true)
            // 遷移をキャンセル
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    
}
