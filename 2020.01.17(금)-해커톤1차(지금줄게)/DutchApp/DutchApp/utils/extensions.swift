//
//  extensions.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/16.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import Foundation
import UIKit
// 4시 30분 수정
extension UIViewController { //스위프트파일 따로 만들고  각각의 뷰에서 호출해 사용하면된다.
    func setNaviBar() {
        guard let navi = self.navigationController else { return }
        navi.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.8136802316, blue: 0.8149855137, alpha: 1)
        
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "NanumSquareRoundR", size: 20)
        ]
        self.navigationItem.backBarButtonItem?.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = attrs as [NSAttributedString.Key : Any]
//        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        bar.shadowImage = UIImage()
//        bar.backgroundColor = buttonColor
    }
    
    func setTabBar() {
        guard let tab = self.tabBarController else { return }
        tab.tabBar.tintColor = .white
        tab.tabBar.barTintColor = #colorLiteral(red: 0, green: 0.8136802316, blue: 0.8149855137, alpha: 1)
    }
}


