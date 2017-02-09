//
//  UniversalLinksViewController.swift
//  ULSample
//
//  Created by hirauchi.shinichi on 2017/02/09.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class UniversalLinksViewController: UIViewController {

    @IBOutlet weak var urlLabel: UILabel!
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlLabel.text = url
    }

    @IBAction func tapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
