//
//  UIWebViewController.swift
//  ULSample
//
//  Created by hirauchi.shinichi on 2017/02/08.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class UIWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var uiWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: SourceUrl)!
        let request: NSURLRequest = NSURLRequest(url: url)
        uiWebView.loadRequest(request as URLRequest)
        
        navigationItem.title = "UIWebView"
        uiWebView.delegate = self
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url?.absoluteString
        if url == DestinationUrl {
            // UniversalLinksで起動された場合の処理
            let viewController = navigationController?.viewControllers.first as! ViewController
            viewController.openUniversalLinksView(url: url!)
            // NavigationControllerで戻る
            _ = navigationController?.popViewController(animated: true)
            // 遷移をキャンセル
            return false
        }
        return true
    }
}
