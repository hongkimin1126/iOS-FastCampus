//
//  SecondViewController.swift
//  delegateTest
//
//  Created by 홍기민 on 2020/02/07.
//  Copyright © 2020 hongkimin. All rights reserved.
//
//첫번쨰 화면에서 함수구현 하고 세컨트vc에서 함수르르 사용해서 두번째 화면 레이블에 값을 넣어준다.

import UIKit

class SecondViewController: UIViewController, DelegateFunc{
    func sendTextField(_ word: String) {
        self.label.text = word
    }
    
    let label = UILabel()
    let dismissButton = UIButton(type: .system)
    
    weak var delegate2: DelegateFunc2?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(dismissButton)
        (presentingViewController as! FirstViewController).delegate1  =  self //(presentingViewController as! FirstViewController)는 실데로 존재하는 FirstViewController를 의미한다.!!!
        
    
        label.backgroundColor = .yellow
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = delegate2?.sendTextField2()
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissTab), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: -100).isActive = true
    }
    
    @objc func dismissTab() {
        dismiss(animated: true, completion: nil)
    }
    
}

protocol DelegateFunc2: class {
    func sendTextField2() -> String
}
