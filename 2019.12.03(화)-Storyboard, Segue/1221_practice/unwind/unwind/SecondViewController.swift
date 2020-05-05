//
//  SecondViewController.swift
//  unwind
//
//  Created by 신용철 on 2019/12/21.
//  Copyright © 2019 신용철. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let secondLabel = UILabel()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(secondLabel)
        secondLabel.text = "second"
        secondLabel.textColor = .red
        secondLabel.textAlignment = .center
        secondLabel.font = UIFont.systemFont(ofSize: 30)
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        secondLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100 + view.safeAreaInsets.top).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
