//
//  ViewController.swift
//  unwind
//
//  Created by 신용철 on 2019/12/21.
//  Copyright © 2019 신용철. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel = UILabel()
    let nextButton = UIButton()
    
    
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: (100 + view.safeAreaInsets.top)).isActive = true
        
        let constraintTitle = titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        constraintTitle.priority = .defaultLow
        constraintTitle.isActive = true
        
        let constraintTitle2 = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10 + view.safeAreaInsets.left)
        constraintTitle2.isActive = true
        constraintTitle2.priority = .defaultHigh
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
         
        titleLabel.text = "처음화면"
//        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)

        nextButton.setTitle("다음으로", for: .normal)
        nextButton.setTitleColor(.blue, for: .focused)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    }

    @IBAction func unwindToFirstView(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
    }
}

