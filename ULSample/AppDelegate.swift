//
//  AppDelegate.swift
//  ULSample
//
//  Created by hirauchi.shinichi on 2017/02/07.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: ViewController!
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            print("application(_:continue:restorationandler:)")
            
            let url = (userActivity.webpageURL?.absoluteString)!
            print("URL=\(url)")
            viewController.openUniversalLinksView(url: url)
        }
        return true
    }
}

