//
//  ViewController.swift
//  PlusMinusSum
//
//  Created by 홍기민 on 2019/11/23.
//  Copyright © 2019 hongkimin. All rights reserved.
//[UI] 플러스 마이너스버튼으로 레이블값변경

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    var sum = 0
    let plusbutton = UIButton(type: .system)
    let minusbutton = UIButton(type: .system)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setting()
    }

  
    @objc func plus(_ sender: UIButton){
        sum += 1
        number.text = "\(sum)"
        if plusbutton.titleColor(for: .normal) == .red {
            self.plusbutton .setTitleColor(.blue, for: .normal)
        }else {
            self.plusbutton.setTitleColor(.red, for: .normal)
        }
        
        if minusbutton.titleColor(for: .normal) == .blue {
            self.minusbutton .setTitleColor(.red, for: .normal)
        }else {
            self.minusbutton.setTitleColor(.blue, for: .normal)
        }
        
        
    }
    
    @objc func minus(_ sender: UIButton){
        sum -= 1
        number.text = "\(sum)"
        
    }
    
    func setting(){
        
        number.text = "\(sum)"
               
               
               plusbutton.setTitle("+", for: .normal)
               plusbutton.setTitleColor(.red, for: .normal)
               plusbutton.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
               plusbutton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
               view.addSubview(plusbutton)
               plusbutton.addTarget(self, action: #selector(plus), for: .touchUpInside)
               
               
               minusbutton.setTitle("-", for: .normal)
               minusbutton.setTitleColor(.blue, for: .normal)
               minusbutton.frame = CGRect(x: 30, y: 90, width: 100, height: 100)
               minusbutton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
               view.addSubview(minusbutton)
               minusbutton.addTarget(self, action: #selector(minus), for: .touchUpInside)
    }
    
    
    
    

}

