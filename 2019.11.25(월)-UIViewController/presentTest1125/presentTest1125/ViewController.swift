//
//  ViewController.swift
//  presentTest1125
//
//  Created by 홍기민 on 2019/11/25.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit


//버튼만든다: 버튼 변수생성, 버튼 속성정의, 버튼 기능 부여, 버튼을 뷰에 추가.
//버튼 틀릭하면 다른 화면 팝업된다.: 다른 화면을 추가, 버튼의 기능에 다른 화면을 팝업시키도록 코딩한다.
//다른화면에서 상호작용한다. 예)2번화면에서 1번화면으로 돌아갈때 1번 화면의 버튼이나 배경의 속성을 변경한다(타입캐스팅)

class ViewController: UIViewController {
    
    let nextButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI(){
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.center = view.center
        nextButton.frame.size = CGSize(width: 100, height: 50)
        nextButton.addTarget(self, action: #selector(didTouchNextButton), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    @objc func didTouchNextButton(_ sender: UIButton){  //여기가 핵심!!!!!!
        let aaa = NextViewController()  //aaa에 NextViewController 담기
        
        aaa.modalPresentationStyle = .fullScreen // 13버전에서 기본값이 카드형태라서 화면 꽉채우려면 이거 쓴다!!!!
        
        
        present(aaa, animated: true)    //외우기 팝업
    }
    
    //타입캐스팅
    
    
    
    
    
}

