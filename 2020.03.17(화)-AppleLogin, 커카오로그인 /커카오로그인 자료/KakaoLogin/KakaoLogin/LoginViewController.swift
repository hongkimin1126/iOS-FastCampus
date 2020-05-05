//
//  LoginViewController.swift
//  KakaoLogin
//
//  Created by 홍기민 on 2020/03/26.
//  Copyright © 2020 hongkimin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let loginButton = UIButton()
    

    

    
    @objc func didTouch(_ sender: UIButton){
        print("sdfsfasdfasdfadsfsadfasdfsda")
        guard let session = KOSession.shared() else {print("탈출");return}
        if session.isOpen() { //이미 로그인 화면에 있음에도 불구하고 로그인 상태라면 기존 로그인을 종료하고 새로 오픈.
            session.close()
        }
        
        //로그인하는 과정
        session.open(completionHandler: { (error) in
            if !session.isOpen() {//로그인이 되지 않는 경우.
                if let error = error as NSError? {// 로그인 되지 않아서 애러 확인.
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue): // error.code 숫자라서  Int(KOErrorCancelled.rawValue) -> 숫자화시킴
                        print("Cancelled")
                    default:
                        print(error.localizedDescription)
                    }
                }
            } else {// 로그인을 실행했고 성공적으로 로그인이 된 경우에 rootView를 MainViewController로 변경.
                print("로그인 성공")
                guard let delegate = UIApplication.shared.delegate as? AppDelegate else {return}
                delegate.window?.rootViewController = MainViewController()
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])//로그인 연동할때 카카오톡,카카오스토리 둘중하나 선택할수있음. 여기서는 talk이고 안하면 기본값이 talk임.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = .white

        view.addSubview(loginButton)
        loginButton.setBackgroundImage(UIImage(named: "카카오바튼"), for: .normal)
        loginButton.layer.cornerRadius = 6
        loginButton.clipsToBounds = true
        loginButton.setTitleColor(.white, for: .highlighted)
        loginButton.backgroundColor = .black
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        loginButton.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
        
        loginButton.layout.centerY().centerX()
    }
    



}
