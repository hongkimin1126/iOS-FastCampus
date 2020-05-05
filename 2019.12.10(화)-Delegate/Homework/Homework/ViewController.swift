//
//  ViewController.swift
//  Homework
//
//  Created by 신용철 on 2019/12/24.
//  Copyright © 2019 신용철. All rights reserved.
//protocol FirstViewControllerDelegate {
//  func 어떤 함수1
//}
//class FirstViewController {
//  var delegate: FirstViewControllerDelegate?
//  delegate?.어떤 함수1()   // 어느 시점에서 실행
//}
//FirstViewController:  SecondViewControllerDelegate {
//  // 코드
//}
//////////
//protocol SecondViewControllerDelegate {
//  func 어떤 함수2
//}
//class SecondViewController {
//  var delegate:  SecondViewControllerDelegate?
//  delegate?.어떤 함수2()   // 어느 시점에서 실행
//}
//extension SecondViewController: FirstViewControllerDelegate  {
//  // 코드
//}



import UIKit

class ViewController: UIViewController {

    let textField = UITextField()
    let button = UIButton(type: .system)
    
    weak var delegate: ChangeLabel?
    
    @objc func didTouch(_ sender: UIButton){
           let nvc = SecondViewController()
        
           present(nvc, animated: true)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.font = UIFont.systemFont(ofSize: 15) //
        textField.borderStyle = .roundedRect //모서리가 둥근 사각형
        textField.adjustsFontSizeToFitWidth = true //글자수 초과하면 글자수 작아짐(미니멈으로 설정한 데 까지)
        textField.clearsOnBeginEditing = true //편집시작하면 기존에 작성된 것 초기화
        textField.placeholder = "texField"
        view.addSubview(textField)
        
        
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        button.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
        view.addSubview(button)

    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
   
}

protocol ChangeLabel: class {
    func someFunction(_ x: String)
}



//두번째 페이지 함수에서 델리게이트에서 넘겨준
//델리게이트의 역할 : 첫번째 페이지에서 텍스트필드에 작성한 내용을 반환해준다.
//두번째 페이지에서 그 함수로 반환된 내용이 label에 삽입된다.
//첫번째 페이지에서는 텍스트 필드의 텍스트 값을 반환한다.
