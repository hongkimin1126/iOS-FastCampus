//
//  SecondViewController.swift
//  segueHomework
//
//  Created by 신용철 on 2019/12/24.
//  Copyright © 2019 신용철. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let imgView = UIImageView()
    let closeButton = UIButton(type: .system)
    let plusButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        closeButton.setTitle("close", for: .normal)
        closeButton.setTitleColor(.red, for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        closeButton.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
        
        plusButton.setTitle("plus", for: .normal)
        plusButton.setTitleColor(.blue, for: .normal)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        plusButton.addTarget(self, action: #selector(didTouch2(_:)), for: .touchUpInside)
        
        view.addSubview(closeButton)
        view.addSubview(plusButton)
        view.addSubview(imgView)
    }
    @objc func didTouch(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
           }
    
    @objc func didTouch2(_ sender: UIButton){
        guard let fvc = presentingViewController as? ViewController else { return }
        fvc.dog += 1
        fvc.cat += 1
        fvc.bird += 1
        fvc.label.text = "dog:\(fvc.dog), cat: \(fvc.cat), bird:\(fvc.bird)"
       }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100 + view.safeAreaInsets.left).isActive = true
        imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100 - view.safeAreaInsets.right).isActive = true
        imgView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerXAnchor.constraint(equalTo: imgView.centerXAnchor, constant: 0).isActive = true
        closeButton.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 50).isActive  = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.centerXAnchor.constraint(equalTo: closeButton.centerXAnchor, constant: 0).isActive = true
        plusButton.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 50).isActive  = true
        
    }
}
