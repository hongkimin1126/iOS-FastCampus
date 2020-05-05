//
//  AppDelegate.swift
//  viewControlLifecycle
//
//  Created by 홍기민 on 2019/11/25.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //버전에 관계없이 무조건 실헹
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
        
        
        if #available(iOS 13.0, *){
            
        }else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.backgroundColor = .white
            window?.rootViewController = ViewController()
            window?.makeKeyAndVisible()
            
        }
        return true

    }

   

}

