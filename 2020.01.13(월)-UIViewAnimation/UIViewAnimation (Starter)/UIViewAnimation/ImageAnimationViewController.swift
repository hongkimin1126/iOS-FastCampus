 //
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ImageAnimationViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var repeatCountLabel: UILabel!
  
  let images = [
    "AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"
    ].compactMap(UIImage.init(named:))//요걸 하게면 스트링 이었던것이 UIImage이된다.
   
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.animationImages = images
  }
  
  @IBAction private func startAnimation(_ sender: Any) {
    imageView.startAnimating() //애니매이션 실해 해주는거
  }
  
  @IBAction private func stopAnimation(_ sender: Any) {
    guard imageView.isAnimating else { return }
    imageView.stopAnimating() //애니메이션 멈추는거
  }
  
  @IBAction private func durationStepper(_ sender: UIStepper) {
    durationLabel.text = "\(sender.value)" //UIStepper의 벨류는 더블타입이다.
    imageView.animationDuration = sender.value
    //defult 0 - 1/30초
  }
  
  @IBAction private func repeatCountStepper(_ sender: UIStepper) {//몇번만 반복하라는 기능
    let repeatCount = Int(sender.value)
    repeatCountLabel.text = "\(repeatCount )"
    imageView.animationRepeatCount = repeatCount
    //defult 0 - 무한 반복
  }
}

 ///마지막꺼 하다가 앱터졌다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 //실스  어캐해???
