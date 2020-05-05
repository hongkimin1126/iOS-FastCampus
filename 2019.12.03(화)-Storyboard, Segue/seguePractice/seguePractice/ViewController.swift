//
//  ViewController.swift
//  seguePractice
//
//  Created by 신용철 on 2019/12/20.
//  Copyright © 2019 신용철. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let onePlusButton = UIButton()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.text = "sdfsdfsdf"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(label)
        
        //오토레이아웃을 사용할 때는 addSubview(onePlusButton)를 먼저 해야 한다.
        view.addSubview(onePlusButton)
        onePlusButton.translatesAutoresizingMaskIntoConstraints = false
        onePlusButton.setTitle("+", for: .normal )
        onePlusButton.setTitleColor(.blue, for: .normal)
        onePlusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        onePlusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        onePlusButton.frame.size = CGSize(width: 100, height: 100)
        onePlusButton.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
        
    }

    @objc func didTouch(_ sender: UIButton){
        let secondVC = SecondViewController()
        secondVC.view.backgroundColor = .systemGray
        present(secondVC, animated: true)
    }


}

