//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CreateNewWSViewController: UIViewController {

  private let createWSButton: UIButton = {//이럼식으로 사용할수도 있다.
    let button = UIButton(type: .system)
    button.setTitle("Create New Workspace", for: .normal)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
    button.addTarget(self, action: #selector(didTapCreateWSButton(_:)), for: .touchUpInside)
    return button
  }() //클로져 실행하려면 () 뒤에 붙여줘야 한다.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(createWSButton)
    
    createWSButton.layout.centerX().centerY() //UIViewExtension에서 설정한대로 잡힘
   // createWSButton.layout.centerX(equalTo: <#T##NSLayoutXAxisAnchor?#>, constant: <#T##CGFloat#>) //입력해서 변경도 가능
  }
  
  @objc func didTapCreateWSButton(_ sender: UIButton) {
    let vc = NameWSViewController()
    let naviController = UINavigationController(rootViewController: vc)
    naviController.modalPresentationStyle = .fullScreen
    present(naviController, animated: true)
  }
}
