//
//  SceneDelegate.swift
//  KakaoLogin
//
//  Created by 홍기민 on 2020/03/26.
//  Copyright © 2020 hongkimin. All rights reserved.
//
//a2228c73a3dc4626590221d82baa6aa1
//a2228c73a3dc4626590221d82baa6aa1
import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
    }

  

    func sceneDidBecomeActive(_ scene: UIScene) {
        KOSession.handleDidBecomeActive()
    }


    func sceneDidEnterBackground(_ scene: UIScene) {
        KOSession.handleDidEnterBackground()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if KOSession.isKakaoAccountLoginCallback(URLContexts.first?.url) {//카카오계정 URL인지 확인하는 먕령어
            
            KOSession.handleOpen(URLContexts.first?.url)//해당 URL로 소셜로그인 토큰을 요청한다.
        }
    }
    
}

