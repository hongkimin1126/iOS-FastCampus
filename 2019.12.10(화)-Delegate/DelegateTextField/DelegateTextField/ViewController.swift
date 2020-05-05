//
//  ViewController.swift
//  DelegateTextField
//
//  Created by 홍기민 on 2019/12/10.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit
//red -> red, blue -> blue, black -> black, 나머지(이상한 글자 포함)는 -> 그레이
class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //textFieldShouldReturn 은 엔터치면 생행하겠다는 것!
        textField.resignFirstResponder()        //키보드 내려가게 만드는것
        if textField.text == "red" {
            myView.backgroundColor = .red
        }else if textField.text == "blue" {
            myView.backgroundColor = .blue
        }else if textField.text == "black"{
            myView.backgroundColor = .black
        }else {
            myView.backgroundColor = .gray
        }
        
        return true
    }
    
}
