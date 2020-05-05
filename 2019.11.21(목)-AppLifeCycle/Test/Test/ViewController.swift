//
//  ViewController.swift
//  Test
//
//  Created by 홍기민 on 2019/11/21.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var bView: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aView.backgroundColor = .red
        
        button.setTitle("AAAA", for: .normal)
        
        
//        let xButton = UIButton()
//        xButton.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
//        xButton.setTitle("bbbbb", for: .normal)
//        xButton.backgroundColor = .red
//        xButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        view.addSubview(xButton)
//
    }

//    @objc private func buttonAction() {
//
//    }

    @IBAction func buttoDidTap() {
        
    }
}

