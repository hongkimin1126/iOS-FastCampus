//
//  ViewController.swift
//  viewControlLifecycle
//
//  Created by 홍기민 on 2019/11/25.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //fullscreen model present style

    override func viewDidLoad() {
      super.viewDidLoad()
      print("viewDidLoad")
      setupUI()
    }
    func setupUI() {
      if #available(iOS 13.0, *) {
        view.backgroundColor = .systemBackground
      } else {
        view.backgroundColor = .white
      }
      let button = UIButton(type: .system)
      button.frame.size = CGSize(width: 100, height: 50)
      button.center = view.center
      button.setTitle("Button", for: .normal)
      button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
      view.addSubview(button)
    }
    @objc private func didTapButton(_ sender: UIButton) {
      let nextVC = NextViewController()
      present(nextVC, animated: true)
    }
    
         

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         print("viewDidDisappear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
        
    }

    









}



