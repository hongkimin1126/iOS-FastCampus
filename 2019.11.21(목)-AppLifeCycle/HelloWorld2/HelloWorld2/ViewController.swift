//
//  ViewController.swift
//  HelloWorld2
//
//  Created by 홍기민 on 2019/11/25.
//  Copyright © 2019 hongkimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var orange: UIView!
    //여기서 위에 코드 지우고 실해하면 뻑난다 코드상에서는 지워졌지만 스토리 보드상에서는 남아있기 때문이다.
    @IBOutlet weak var label: UILabel!
    
    //버튼은 액션
    @IBAction func myButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {       //viewDidLoad 회면에 젤처음 보여주는것!
        super.viewDidLoad()
        
        

        
        
        //        let blueview = UIView()
//        blueview.backgroundColor = .systemBlue
//        view.addSubview(blueview)
//        blueview.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        blueview.center = view.center//blueview의 중심을 view의 중심에 맞추겠다
        
        
        
//        //위에 아웃렛들 설정
//        view1.backgroundColor = .red
//        orange.backgroundColor = .yellow
//        label.text = "ABC"
 
    
    
    }


}

