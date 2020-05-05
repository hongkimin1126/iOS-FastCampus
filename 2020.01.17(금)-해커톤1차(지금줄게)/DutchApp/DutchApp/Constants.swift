//
//  Constants.swift
//  DutchApp
//
//  Created by Hongdonghyun on 2020/01/15.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

let mainColor = UIColor(rgb: 0x73F5F5)
//let buttonColor = UIColor(rgb: 0x5cc4c4)
let buttonColor = #colorLiteral(red: 0, green: 0.7938875556, blue: 0.7916871309, alpha: 1)
let placeHolderColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
let bankArray = ["국민", "신한", "우리", "하나", "기업", "농협", "산업","수협", "새마을", "카카오"].sorted()

func accountFlat(_ bank: String, _ accountNo: String, _ holder: String) -> String {
    return "\(bank) \(accountNo) \(holder)"
}

func dateToString(date: Date = Date()) -> String {
    let now = date
    let today = DateFormatter()
    today.locale = Locale(identifier: "ko_kr")
    today.dateFormat = "yyyy-MM-dd"
    return today.string(from: now)
}

func amountToString(amount: String) -> String? {
    let numberFormatter = NumberFormatter()
    let amount = amount.replacingOccurrences(of: ",", with: "")
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 3
    return numberFormatter.string(from: NSNumber(value: Int(amount)!))!
}

func amountReplace(_ text: String) -> Int {
    let amount = text.replacingOccurrences(of: ",", with: "")
    if amount.isEmpty {
        return 0
    } else {
        return Int(amount)!
    }
    
    
}

func getBarButton(_ title : String) -> UIBarButtonItem{
    let customButton =  UIButton.init(type: .custom)
    customButton.setTitle(title, for: .normal)
    customButton.frame = CGRect.init(x: 0, y: 5, width: 140, height: 32)
    customButton.setTitleColor(.white, for: .normal)
    return UIBarButtonItem.init(customView: customButton)
}
