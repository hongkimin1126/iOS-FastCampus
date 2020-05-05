//
//  NextViewController.swift
//  presentTestRe1
//
//  Created by 홍기민 on 2019/11/27.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit
//버튼만든다: 버튼 변수생성, 버튼 속성정의, 버튼 기능 부여, 버튼을 뷰에 추가.
//버튼 틀릭하면 다른 화면 팝업된다.: 다른 화면을 추가, 버튼의 기능에 다른 화면을 팝업시키도록 코딩한다.
//다른화면에서 상호작용한다. 예)2번화면에서 1번화면으로 돌아갈때 1번 화면의 버튼이나 배경의 속성을 변경한다(타입캐스팅)

class NextViewController: UIViewController {
    let returnButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setButton()
        // Do any additional setup after loading the view.
    }
    
    func setButton(){
        
        returnButton.setTitle("뒤로가기", for: .normal)
        returnButton.setTitleColor(.yellow, for: .normal)
        returnButton.frame.size = CGSize(width: 100, height: 50)
        returnButton.center = view.center
        
        returnButton.addTarget(self, action: #selector(didTabreturnButton(_:)), for: .touchUpInside)
        view.addSubview(returnButton)
        
        
    }

    @objc func didTabreturnButton(_ sender: UIButton){
        presentingViewController?.view.backgroundColor = .brown
        
        guard let vc = presentingViewController as? ViewController else{return}
        vc.nextButton.setTitleColor(.green, for: .normal)
        
        dismiss(animated: true)
        
        
    }
}
