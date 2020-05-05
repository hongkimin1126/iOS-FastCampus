//
//  NextViewController.swift
//  presentTest1125
//
//  Created by 홍기민 on 2019/11/25.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    let returnButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupUI()
    }
    
    func setupUI(){
        returnButton.setTitle("뒤로가기", for: .normal)
        returnButton.center = view.center
        returnButton.frame.size = CGSize(width: 100, height: 50)
        returnButton.setTitleColor(.yellow, for: .normal)
        returnButton.addTarget(self, action: #selector(didTouchReturnButton), for: .touchUpInside)
        view.addSubview(returnButton)
        
    }
    
    @objc func didTouchReturnButton(_ sender : UIButton){
        //첫번째 화면 배경 변경하기:  타입캐스팅 필요 없ㅈ다
        //첫번째 회면 버튼 이름 바꾸기: 타입 캐스팅 필요하다.
        
        presentingViewController?.view.backgroundColor = .green    //나를 팝업시켜준놈
        
        guard let vc = presentingViewController as? ViewController  else{return}    //외우자
        //타입 캐스팅 공식!!!!!!!!!!부모클래스가 가지고 있지 않은 변수에 접근하기 위해서 사용!!!!버튼에 접근하기 위해서2
        //ViewController는 내가 커스터마이징 한것이라 버튼에 접근하려면 타입캐스팅이 필요하다.
        vc.nextButton.setTitleColor(.black, for: .normal)
        
        //presentedViewController     //내가 팝업시켜준놈
        dismiss(animated: true) //
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




