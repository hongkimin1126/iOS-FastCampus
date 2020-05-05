//
//  ViewController.swift
//  touchTest
//
//  Created by 홍기민 on 2020/02/09.
//  Copyright © 2020 hongkimin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    var trueFalse = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.image = UIImage(named: "cat1")
        
        imageView.layout.centerX().centerY()
        //        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true   //이거 는 왜 생성이 안되나????????  클립투 바운드 안먹는다 그래서  밑에 프레임사이즈로 넣어줌
        //        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.frame.size = CGSize(width: 150, height: 150)
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true  //클립투 바운드 왜 안먹히나?????????
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //터치시작시 호출 //캡제스쳐와다르게 클리만하면 변경된다.
        super.touchesBegan(touches, with: event)
        
        let touch = touches.first
        let touchPoint = touch?.location(in: touch?.view)
        
        if imageView.frame.contains(touchPoint!) {
            imageView.image = UIImage(named: "cat2")
            trueFalse = true
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {//드래그시 호출
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first
        let touchPoint = touch?.location(in: touch?.view)
        
        if trueFalse {
            imageView.center = touchPoint!
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) { //터치중에 전화오거나 상황발생되서 취소되는 경우 엔디드랑 차이점!!!
        super.touchesCancelled(touches, with: event)
        print(#function)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) { //아무문제 없이 종요되면 호출되고
        super.touchesEnded(touches, with: event)
        print(#function)
    }
    
    
}

