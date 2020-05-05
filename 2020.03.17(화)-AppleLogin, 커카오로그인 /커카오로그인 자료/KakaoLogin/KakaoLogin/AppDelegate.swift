//
//  AppDelegate.swift
//  KakaoLogin
//
//  Created by 홍기민 on 2020/03/26.
//  Copyright © 2020 hongkimin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loginChangedNoti()
        
        //로그인 되어있으면 메인으로가고, 로그인 안되있으면 로그인화면 띄운다.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let session = KOSession.shared(), session.isOpen() {
            self.window?.rootViewController = MainViewController()
        } else {
            self.window?.rootViewController = LoginViewController()
        }
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        
        return true
    }
    
    func loginChangedNoti() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeKakaoSession), name: .KOSessionDidChange, object: nil)
        //카카오 로그인 상태에 변화가 있을때 호출되는 노티.
    }
    
    //위의 노티가 실행되면 호출되는 함수.
    @objc func didChangeKakaoSession(_ sender: Notification) {
        guard let session = sender.object as? KOSession else { return}
        //로그인 상태로 변경된것이면 Login 출력하고, 로그아웃 상태로 변경되면 Logout 출력.
        if session.isOpen() {
            
            //URLSession.dataTask 에 POST request로  session.token을 서버에 보내주고 completion로 해당 토큰에 해당되는유저의 data를 fetch하라는 코드를 구현.
            print("Login")
        } else {
            print("Logout")
        }
        
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        KOSession.handleDidEnterBackground()
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {//카카오계정 URL인지 확인하는 먕령어
            return KOSession.handleOpen(url) //해당 URL로 소셜로그인 토큰을 요청한다.
        }
        return false
    }
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

