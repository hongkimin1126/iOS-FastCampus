//
//  ViewController.swift
//  delegateTest
//
//  Created by 홍기민 on 2020/02/07.
//  Copyright © 2020 hongkimin. All rights reserved.

import UIKit

class FirstViewController: UIViewController, DelegateFunc2 {
    func sendTextField2() -> String  {
        //1 화면의 텍스트필드에 입력한값이 2번화면의 레이블에 들어가는 상황
        
        return textField.text ?? ""
    }
    
    let textField = UITextField()
    let button1 = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    var word = ""
    
    weak var delegate1: DelegateFunc?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(button1)
        view.addSubview(button2)
        
        
        
        
        
        textField.font = UIFont.systemFont(ofSize: 15) //
        textField.borderStyle = .roundedRect //모서리가 둥근 사각형
        textField.adjustsFontSizeToFitWidth = true //글자수 초과하면 글자수 작아짐(미니멈으로 설정한 데 까지)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        button1.setTitle("Delegate1", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.addTarget(self, action: #selector(didTab1), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button1.centerYAnchor.constraint(equalTo: textField.centerYAnchor, constant: -100).isActive = true
        
        button2.setTitle("Delegate2", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.addTarget(self, action: #selector(didTab2), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button2.centerYAnchor.constraint(equalTo: button1.centerYAnchor, constant: 30).isActive = true
        
        
    }
    //MARK: present 뒤에 delegate1?.sendTextField(self.textField.text ?? "") 를 함면 되고 전에 사용하면 안되는 이유는 func가 viewdidload 보다 뒤에 호출되기때문이다.
    //MARK:      present(svc, animated: true)은 viewdidload ->  present ->func  !!!!!
    //MARK: 이거 너무 중요하다.*********************************************
    @objc func didTab1(_ sender: UIButton) {
        let svc = SecondViewController()
        present(svc, animated: true)
        delegate1?.sendTextField(self.textField.text ?? "")
        
        
    }
    
    @objc func didTab2() {
        let svc = SecondViewController()
        svc.delegate2 = self //MARK: svc.delegate2 = self는 위에랑 다르게 설정값이라서 viewdidload에 반영해줘야해서 present보다 먼저 세팅해야 한다. !!!이거 너무 중요하다 시점
        //*********************************************** 여기 너무 중요하다
        present(svc, animated: true)
        
        
       
    }
    
    
}

protocol DelegateFunc: class {
    func sendTextField(_ word: String)
}
