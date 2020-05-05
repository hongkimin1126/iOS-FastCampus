//
//  NextViewController.swift
//  viewControlLifecycle
//
//  Created by 홍기민 on 2019/11/25.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
           super.viewDidLoad()
//        view.backgroundColor = .white
            print("NextviewDidLoad")
           // Do any additional setup after loading the view.
       }

       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           print("NextviewWillAppear")
       }

       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           print("NextviewDidAppear")
       }
       
       override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
            print("NextviewDidDisappear")
       }
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           print("NextviewWillDisappear")
           
       }

}
