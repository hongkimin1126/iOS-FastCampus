//
//  SecondViewController.swift
//  HomeworkUserDefault
//
//  Created by 신용철 on 2019/12/24.
//  Copyright © 2019 신용철. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   let label = UILabel()
        let button = UIButton(type: .system)
    var data = UserDefaults.standard
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .yellow
            label.text  = data.string(forKey: "dataKey")
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    //        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            view.addSubview(label)
            button.setTitle("뒤로", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
            button.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
            view.addSubview(button)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive  = true
        }
        @objc func didTouch(_ sender: UIButton){
            dismiss(animated: true, completion: nil)
        }
}
