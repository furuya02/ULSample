//
//  ViewController.swift
//  ULSample
//
//  Created by hirauchi.shinichi on 2017/02/07.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    // Universal Linksで起動された場合のURL
    private var url = ""
    private var sfview: SFSafariViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "テストアプリ"
        let button = UIBarButtonItem()
        button.title = "戻る"
        navigationItem.backBarButtonItem = button

        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.viewController = self

    }

    @IBAction func tapUIWebView(_ sender: Any) {
        performSegue(withIdentifier: "toUIWebView",sender: nil)
    }

    @IBAction func tapWKWebView(_ sender: Any) {
        performSegue(withIdentifier: "toWKWebView",sender: nil)
    }

    @IBAction func tapSFSafariViewController(_ sender: Any) {
        sfview = SFSafariViewController(url: URL(string: SourceUrl)! as URL, entersReaderIfAvailable: true)
        present(sfview!, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let universalLinksViewController: UniversalLinksViewController = segue.destination as? UniversalLinksViewController {
            universalLinksViewController.url = url
        }
    }
    
    // Universal Linksで起動された場合に、遷移する
    func openUniversalLinksView (url: String){
        // もし、SFSafariViewControllerが表示されていたらクローズする
        sfview?.dismiss(animated: true, completion: nil)
        
        self.url = url
        performSegue(withIdentifier: "toUniversalLinks",sender: nil)
    }
}

