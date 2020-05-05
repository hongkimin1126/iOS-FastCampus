//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    //세팅 오픈
    //다른앱을 열수 있도록하는 것 URLScheme
    @IBAction private func openSetting(_ sender: Any) {
        print("\n---------- [ openSettingApp ] ----------\n")
        //세팅앱 여는것!!!
        guard let url = URL(string: UIApplication.openSettingsURLString),       //열수 있는지 확인하는 작업
            UIApplication.shared.canOpenURL(url) else { return }//????????????????????
        
        UIApplication.shared.open(url)
        
        
        
    }
    
    @IBAction private func openMail(_ sender: Any) {//메일 오픈
        print("\n---------- [ openMail ] ----------\n")
        //        let scheme = "mailto:"
        //    let scheme = "mailto: someone@mail.com,someone2@mail"  //위에꺼 주석하고 이거쓰면 받는사람 메일주소가 기입한 상태로 화면이 띄워진다.
        let scheme = "mailto:?cc=foo@bar.com&subject=title&body=MyText" //  참조기능 쓰게 해주는거 이거 별로 신경쓰지마라 메일에서 부수적인 기능이다.
        guard let url = URL(string: scheme),       //열수 있는지 확인하는 작업
            UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url)
        
    }
    
    @IBAction private func openMessage(_ sender: Any) {   //메세지 오픈
        print("\n---------- [ openMessage ] ----------\n")
        let url = URL(string: "sms:010-7441-7101&body=Hello")! //연락처와 Hello라는 내용이 기입된다. , 한글은 문제가생김 어떻게 사용해 그럼??????
//        var componet = URLComponents(string: "sms:010-9999-9999")!
//        let a = URLQueryItem(name: "body", value: "안녕")
//        componet.queryItems?.append(a)
//        let finalURL = componet.url!
//        print(finalURL)
//        guard UIApplication.shared.canOpenURL(finalURL) else { return }
//
//        UIApplication.shared.open(finalURL)
        
        UIApplication.shared.open(url)
        
    }
    
    @IBAction private func openWebsite(_ sender: Any) {   //사이트 오픈
        print("\n---------- [ openWebsite ] ----------\n")
        let url = URL(string:  "https://goole.com")!
        UIApplication.shared.open(url)
    }
    
    
    //↑윗쪽은 시스템앱
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //↓아래쪽은 3rd party앱
    //3rd party앱에 대해서 화이트리스트 등록 필요
    //최초 1회 넘어갈때 이동을 허락하면 이후부터는 바로 넘어간다.
    
    
    @IBAction private func openFacebook(_ sender: Any) {
        //3rd party앱에 대해서 화이트리스트 등록 필요
        //최초 1회 넘어갈때 이동을 허락하면 이후부터는 바로 넘어간다.
        print("\n---------- [ openFacebook ] ----------\n")
        let url = URL(string: "fb:")!
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url)
    }
    
    @IBAction private func openMyApp(_ sender: Any) { //이거는 우리가 만든 앱을 넣는 것!!!!!
        print("\n---------- [ openMyApp ] ----------\n")
        /***********************************************************
         myApp://host?name=abc&age=10
            -scheme: myApp
            -host: host
            -query: name=abc&age=10
            
        *************************************************************/
//        let url = URL(string: "myApp://host?name=abc&age=10")!  //이런식으로도 가능하다
        
//        let url = URL(string: "myApp:")!  //여기서 중요한것은 새로 만든 myApp를 먼저한번 설치해주고 그다음에 실행하여야 작동한다.
//        guard UIApplication.shared.canOpenURL(url) else { return }
//
//        UIApplication.shared.open(url)
//
        
        let memoUrl = URL(string: "KxMemo:")!  //내가만든 메모앱 실행한것.
        guard UIApplication.shared.canOpenURL(memoUrl) else { return }

        UIApplication.shared.open(memoUrl)
    }
}




