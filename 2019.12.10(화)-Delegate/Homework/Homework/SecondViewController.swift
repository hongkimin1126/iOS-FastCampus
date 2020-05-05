//
//  SecondViewController.swift
//  Homework
//
//  Created by 신용철 on 2019/12/25.
//  Copyright © 2019 신용철. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        layout()
    }
    
    @objc func didTouch(_ sender: UIButton){
          dismiss(animated: true, completion: nil)
       }
    
    func setupUI(){
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .red
        label.textAlignment = .center
        view.addSubview(label)
        
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        button.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    func layout(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
}
