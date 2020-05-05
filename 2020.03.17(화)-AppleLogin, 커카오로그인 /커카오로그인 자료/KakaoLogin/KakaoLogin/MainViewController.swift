//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 홍기민 on 2020/03/26.
//  Copyright © 2020 hongkimin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let label = UILabel()
    let loginButton = UIButton()
    
    
    @objc func didTouch(_ sender: UIButton){
        KOSession.shared()?.logoutAndClose(completionHandler: { (success, error) in
            //success는 로그아웃 성공여부 불타입
            if let error = error {
                return print(error.localizedDescription)
            }
            guard let delegate = UIApplication.shared.delegate as? AppDelegate else {return}
            delegate.window?.rootViewController = LoginViewController()
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews([loginButton, label, profileImageView])
        
        label.font = UIFont.systemFont(ofSize: 40)
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .center
        
        
        
        loginButton.setTitle("Logout", for: .normal)
        loginButton.setTitleColor(.white, for: .highlighted)
        loginButton.backgroundColor = .black
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        loginButton.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
        
        profileImageView.layout.centerX().centerY()
        profileImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        label.layout.centerX().top(equalTo: profileImageView.bottomAnchor, constant: 15)
        
        loginButton.layout.centerX().centerY(equalTo: label.bottomAnchor, constant: 40)
        
        loadprofile()
        }
    
    //로그인 성공한뒤에 닉네임과 사진 가져오는 기능.
    func loadprofile() {
        KOSessionTask.userMeTask { [weak self](error, userMe) in //userMe 얻기 위해서 실행
            if let error = error {
                return print(error.localizedDescription)
            }
            guard let me = userMe, let nickName = me.account?.profile?.nickname, let profileImageLink = me.account?.profile?.profileImageURL
                else {return}
            print(me)
            self?.label.text = nickName
            URLSession.shared.dataTask(with: profileImageLink) { (data, response, error) in
                guard error == nil else {return}
               guard let data = data else {return}
            
                DispatchQueue.main.async {
                    self?.profileImageView.image = UIImage(data: data)
                }
                
            }
        }
        
    }
    
    
}

