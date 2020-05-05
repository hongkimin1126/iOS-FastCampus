//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices   //밑에서 진동기능 넣을려고
//더블탭하면 고양이 사진 4배 커지게 허기
//제스쳐를 오른쪽으로 하면 캣2, 왼쪽은 캣1로 변경되게해라
final class GestureViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    var isQuardruple = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.width / 2 // 버튼과달리 이미지뷰는 이것만 가지고 안된다. 이미지 원형만들기
        imageView.layer.masksToBounds = true //??????????????????????????
    }
    
    
    //TapGesture - Discrete //Discrete?????????????????????뭐야이거
    @IBAction func handelTapGesture(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else { return } //인식이 제대로 될때호출되면 ended가 호출된다
        
        if !isQuardruple {
            //imageView.transform에 현재뷰를 4배시키겠다
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2) //x로2배, y로2배라서 2*2= 4배가 된다
//            imageView.transform = imageView.transform.translatedBy(x: 0, y: 100) // translatedBy는 이동하는 기능
        } else {
            imageView.transform = CGAffineTransform.identity //CGAffineTransform.identity는 트랜스폼을 최초 원본값으로 돌리는 기능!
        }
        isQuardruple.toggle() //??????????????????????
    }
    
    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)  //이거는 고양이가 돌아가긴하지만 미친듯이 돌아간다 이유는 호출이 될때마다 이전에 로테이션값에 추가로 더한다.
        sender.rotation = 0 //이것까지 해주어야 우리가 돌리는 만큼만 돌아간다.!!!!!
    }
    
    
    //제스쳐를 오른쪽으로 하면 캣2, 왼쪽은 캣1로 변경되게해라
    @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            imageView.image = UIImage(named: "cat1")
            sender.direction = .right
        } else {
            imageView.image = UIImage(named: "cat2")
            sender.direction = .left
        }
    }
    
    //PanGesturea는 어렵다.!!!!!   여기 이해 잘안간다???????????????
    //PanGesturea는 뷰가아니라 이미지 뷰에 올려야 한다.
    //PanGesturea로 사진 움직일수있게 구현
    var  initialCenter = CGPoint()
    
    @IBAction func handelPanGesture(_ sender: UIPanGestureRecognizer) {
        guard let dragView = sender.view else {return}
        let translation = sender.translation(in: dragView.superview)    //??????????????뭐야이거???
        
        dragView.isUserInteractionEnabled = true //PanGesture는 뷰가아니라 이미지뷰에 올린거라서 꼭이 작업해주어야 한다. 이게 싫은면 스토리보드에서 유저 인터렉션에서 체크해주기
        
        if sender.state == .began { 
            initialCenter = dragView.center
        }
        if sender.state != .cancelled { //cancelled가 아닌떄
            dragView.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            
        } else {//cancelled일때는 최초위치로 다시 돌아간다.
            dragView.center = initialCenter
        }
    }
    
    //import AudioToolbox.AudioServices 진동기능
    func virbrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}


