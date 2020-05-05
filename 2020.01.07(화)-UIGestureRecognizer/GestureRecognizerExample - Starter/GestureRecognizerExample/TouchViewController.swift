//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

//이미지를 클릭한 이후에만 마우스 움직임을 따라서 이미지뷰가함께 움직이도록
//이미지를 움직일때 더 자연스럽게 움직이도록 구현.

final class TouchViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    var isHoldingImage = false  //이미지를 눌렀는지 정보를 제공하기 위해서 만들었다.
    var lastTouchPoint = CGPoint.zero   //마지막에 터치한 포인트-> 처음은 제로
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //원모양으로 만들기
        imageView.layer.cornerRadius = imageView.frame.width / 2 // 버튼과달리 이미지뷰는 이것만 가지고 안된다.
        imageView.clipsToBounds = true // 이것까지 해주어야 원모양이된다. 뷰의 영역밖을 벗어나는것을 잘라낼수있다.
    }
    
    //터치시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //        print("-----------------touchesBegan----------------------- ")
        guard let touch = touches.first else {return} //첫번째 터치를 가져와서
        let touchPoint = touch.location(in: touch.view) //어느위치에 찍었는지
        
        if imageView.frame.contains(touchPoint) { //이미지를 클릭시에만 변경되게 하는 조건!! 없으면 아무곳만 터치해도 변경이 된다.
            imageView.image = UIImage(named: "cat2") //터치시 이미지 변경
            isHoldingImage = true // 이미지를 눌렀을때만 눌렀다라고 정보를준다.
            lastTouchPoint = touchPoint //터치를 시작했으니 lastTouchPoint가 touchPoint이 된다.
        }
        
    }
    
    //움직일때
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        //         print("---------------touchesMoved ---------------------")
        guard isHoldingImage, let touch = touches.first else {return}   //guard isHoldingImage이 참일때만 움직인다. touchesBegan에서 참으로 변경했다.
        let touchPoint = touch.location(in: touch.view)
        imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)//lastTouchPoint와 현재의 포인트를 비교해서?????????????????????????????????
        imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
        lastTouchPoint = touchPoint //?????????????????
        // imageView.center = touchPoint   // 뷰에 아무곳에나 터치를 하면 터치한곳에 사진이 중앙으로 움직인다. //이걸로 하면 이질감이 있어서 위에 코드로 변경했다.
        
        
        //위의 코드와 같은 기능이나 안정성이 떨어진다.  간단하게 쓰고 싶으면 이거 사용.
//        let preTouchPoint = touch.preciseLocation(in: touch.view)   //preciseLocation 이전의 위치를 알려준다.
//        imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)//lastTouchPoint와 현재의 포인트를 비교해서?????????????????????????????????
//        imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)

    }
    
    //터치하다가 놨을때
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        //        print("------------------touchesEnded--------------------- ")
        imageView.image = UIImage(named: "cat1") //터치끝나면 이미지 변경
        isHoldingImage = false  //터치끝났으니 false로 변경
    }
    
    //터치 실패시
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        imageView.image = UIImage(named: "cat1") //터치가 실패할경우때문에 만들어줌
        isHoldingImage = false
    }
    
}



