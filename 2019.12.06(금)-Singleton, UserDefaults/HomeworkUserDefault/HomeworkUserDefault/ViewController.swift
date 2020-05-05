//
//  ViewController.swift
//  HomeworkUserDefault
//
//  Created by 신용철 on 2019/12/24.
//  Copyright © 2019 신용철. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textField =  UITextField()
    let button = UIButton()
    var data = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        button.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
        view.addSubview(button)
     
        textField.font = UIFont.systemFont(ofSize: 15) //
        textField.borderStyle = .roundedRect //모서리가 둥근 사각형
        textField.adjustsFontSizeToFitWidth = true //글자수 초과하면 글자수 작아짐(미니멈으로 설정한 데 까지)
        textField.clearsOnBeginEditing = true //편집시작하면 기존에 작성된 것 초기화
        textField.placeholder = "texField"
        textField.addTarget(self, action: #selector(didTouch2(_:)), for: .editingDidEndOnExit)
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive  = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50).isActive  = true
    }

    @objc func didTouch(_ sender: UIButton){
        let nvc = SecondViewController()
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true)
    }
    
    @objc func didTouch2(_ sender: UITextField){
        self.data.set("\(sender.text ?? "")", forKey: "dataKey")
        }
}

