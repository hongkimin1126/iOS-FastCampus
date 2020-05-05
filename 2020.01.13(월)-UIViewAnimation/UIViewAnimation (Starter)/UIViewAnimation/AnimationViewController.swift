//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView! //빙글빙글 돌아가는거
    @IBOutlet private weak var countDownLabel: UILabel!
    
    
    
    /*
    @IBOutlet weak var testView: UIView!//????????????나는 놰 안되나?? 그리고 test()는 어디서 호출해???
    func test() {       //이 에니매이션은 뭐야????   //?????????????????????????????????????????묻기
        let initialFrame = testView.frame
        UIView.animateKeyframes(withDuration: 10,  delay: 0,  animations: {
            
            //10초 * 0.0 = 0, 2.5초 동안 애니매이션
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) { //withRelativeStartTime 상대적시간
                self.testView.center.x += 50
                self.testView.center.y -= 150
            }
            //10초 * 0.25 = 2.5초 -> 2.5초 뒤에 2.5초 동안 애니매이션  => 5초
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) { //withRelativeStartTime
                self.testView.center.x += 100
                self.testView.center.y += 50
            }
            // 7초 - 5초 = 2초(아무것도안하고 가만히 있는 시간),10초 * 0.7 = 7초, 10초 * 0.3 = 3초
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) { //withRelativeStartTime
                self.testView.frame = initialFrame
                
            }
        })
        
    }
    */
    
    
    
    
    
    var count = 4 {
        didSet { countDownLabel.text = "\(count)" }
    }
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) { //화면이 나타나고나서 진행된다고
        self.activityIndicatorView.isHidden = true // 히든으로 감춘거!
        super.viewWillAppear(animated)
        
        //회면 왼쪽에서 날라오게하는 애니메이션
        userIdTextField.center.x = -view.frame.width //화면이 왼쪽에 하나더 있다고 생각하고 외쪽화면 끝에있다고 생각해하
        passwordTextField.center.x = -view.frame.width //화면이 왼쪽에 하나더 있다고 생각하고 외쪽화면 끝에있다고 생각해하
        loginButton.center.x = -view.frame.width //화면이 왼쪽에 하나더 있다고 생각하고 외쪽화면 끝에있다고 생각해하
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.6) {// userIdTextField 딜레이없이 바로 보여준다
            self.userIdTextField.center.x = self.userIdTextField.superview!.bounds.midX //bounds 쓴이유: superview는 회색 컨테이너뷰이고 그 회색뷰는 기본뷰보다 조금 왼쪽에서 떨어져 있는데 프레임방식은 본인이 중심이아니라. 기본뷰라서 여기서는 회색뷰에 중심에 맞출거라 바운드를 사용한다.
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.5   , animations: { // userIdTextField보다 0.5초 뒤에 나타난다
            self.passwordTextField.center.x = self.passwordTextField.superview!.bounds.midX
        })
        
        //요거는 튕기는 애니메이션 주고싶어서 만들었다 , curveEaseInOut, .autoreverse, .repeats는 대충만 봐라
        UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {//usingSpringWithDamping: 감쇠비이다 그래서 버튼이 튕긴다
            self.loginButton.center.x = self.loginButton.superview!.bounds.midX
        }, completion: {
            print("isFinished :", $0)   //정상적으로 실행됐는지 확인하가위해!!
        })
        
        
        
    }
    
    // MARK: - Action Handler
    
    @IBAction private func didEndOnExit(_ sender: Any) {}
    
    @IBAction private func login(_ sender: Any) {
        view.endEditing(true) //로그인커튼 눌렀을때 키보드 내려간다
        
        guard countDownLabel.isHidden else { return }
        loginButtonAnimation()
        countDown()
    }
    
    
    func addAnimateKeyframes() {
    }
    
    func loginButtonAnimation() {
        activityIndicatorView.isHidden = false //히든한거 보이게 하는 작업
        activityIndicatorView.startAnimating() //빙글빙글 돌아가는것
        let centerOrigin = loginButton.center
        UIView.animateKeyframes(withDuration: 1.6, delay: 0 , animations: { // userIdTextField보다 0.5초 뒤에 나타난다
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {//loginButton을 0.4초동안 우측아래로 이동
                self.loginButton.center.x += 50
                self.loginButton.center.y += 20
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {//loginButton이 45도 회전하여 우측상단으로 이동하며 흐려지다 사라짐
                self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4) //rotationAngle: .pi / 4 -> 4분의 1만큼 회전시키겠다.
                self.loginButton.center.x += 150
                self.loginButton.center.y -= 70
                self.loginButton.alpha = 0.0    //점점 투명해지는 기능
            }
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {  //loginButton이 처음에 있던 위치의 아래에 위치하도록함 (안보이는 상태)
                self.loginButton.transform = .identity //위에서 회전시킨거 다시 원래대로
                self.loginButton.center = CGPoint(x: centerOrigin.x, y: self.loginButton.superview!.frame.height + 120) //y
                self.loginButton.center.y -= 70
                self.loginButton.alpha = 0.0    //점점 투명해지는 기능
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {  //loginButton이 처음에 있던 위치로 다시 돌아옴
                
                self.loginButton.alpha = 0.1
                self.loginButton.center = centerOrigin
            }
        }) {_ in
            self.activityIndicatorView.stopAnimating() //애니매이팅 끝나는 시점에 빙그빙글 도는거 뭐추게 한것
            self.activityIndicatorView.isHidden = true // 다시 히든으로 감춘거!
        }
        
    }
    
    func countDown() {
        countDownLabel.isHidden = false //countDown동작시에 레이블을 히든에서 해제한다.
        //똑같은 뷰에 대해서???transition
        UIView.transition(with: countDownLabel, duration: 0.5, options: [], animations: {self.count -= 1 })  { _ in
            DispatchQueue.main.asyncAfter(deadline:  .now() + 0.5) {//일부러 딜레이 시간줌
                guard self.count == 0 else {return self.countDown()} //재귀함수!! 카운트가 0인지 확인하고 아니면 다시 카운트다운 해줘!!!
                self.count = 4 //다시 카운트를 4로 만들었다
                self.countDownLabel.isHidden = true
            }
        }
    }
}
