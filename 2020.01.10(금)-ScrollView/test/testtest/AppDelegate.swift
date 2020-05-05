//
//  AppDelegate.swift
//  testtest
//
//  Created by 박지승 on 2020/01/20.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = ViewController()
            window?.makeKeyAndVisible()
            return true
    }

    
}

