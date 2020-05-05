//
//  ViewController.swift
//  appLifeCycle
//
//  Created by 홍기민 on 2020/02/08.
//  Copyright © 2020 hongkimin. All rights reserved.
//
//MARK:  **************** 10버전과 , 13버전은 라이프사이클이 다르다. 
//MARK: ##############ios 10번전으로 세팅헤도 시뮬레이터 기기고유 버전이 13버전이면 신을타니 제대로 확인할려면 버전이랑 시뮬레니터까지 일치시켜야함!!!
//MARK: 안되는예 10버전세팅하고 시뮬레이터 아이폰8 하면 안됨......   10버전은 시뮬레이터 아이폰7으로 세팅!!!

//10버전에서 윌엔터포그라운드, 디디비컴액티브 호출이 안되는데 없는건가요????
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("_____________viewDidLoad________________")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("_____________viewWillAppear________________")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("_____________viewDidAppear________________")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("_____________viewWillDisappear________________")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("_____________viewDidDisappear________________")
    }
    
    
}

