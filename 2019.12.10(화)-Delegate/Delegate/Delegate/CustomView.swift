//
//  CustomView.swift
//  Delegate
//
//  Created by 홍기민 on 2019/12/10.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override var backgroundColor: UIColor? {
        get{super.backgroundColor}
        set{
            super.backgroundColor = newValue  ?? .black //슈퍼 안붙이면 그냥 셀프라 안된다.
            if newValue == .red {
                super.backgroundColor = .blue
            }
            
            
            print("새로 변경된색상은 : ", backgroundColor!)
            
            
            
        }
        
    }

}


//1.프로토콜정의

//2. delegate 프로퍼티 선언
//3. delegate 메서드 호출
