//
//  ViewController.swift
//  segueHomework
//
//  Created by 신용철 on 2019/12/24.
//  Copyright © 2019 신용철. All rights reserved.

// FirstVC 에 Dog, Cat, Bird 라는 이름의 Button을 3개 만들고 숫자를 표시하기 위한 Label 하나 생성
//- SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
//- FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
//  (이미지는 구글링 등을 통해 활용)
//- 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 초과되면 화면이 전환되지 않도록 막기
//  (전환 횟수가 초과된 버튼은 그것만 막고, 횟수가 초과되지 않은 버튼으로는 전환 가능)
//- SecondVC에 추가로 UIButton 을 하나 생성하여 그 버튼을 누를 때마다 개와 고양이, 새 모두에 대해 전환 횟수가 각각 1회씩 추가되도록 구현

import UIKit

class ViewController: UIViewController {

    var dog = 0
    var cat = 0
    var bird = 0
    
    let label = UILabel()
    let dogButton = UIButton(type: .system)
    let catButton = UIButton(type: .system)
    let birdButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
        
    @objc func dogDidTouch(){
        self.dog += 1
        label.text = "dog:\(self.dog), cat: \(self.cat), bird:\(self.bird)"
        let nvc = SecondViewController()
        nvc.imgView.image = UIImage(named: "dog")
        if self.dog < 9 {
            nvc.modalPresentationStyle = .fullScreen
            present(nvc, animated: true) }

        
    }
    
    @objc func catDidTouch(){
        self.cat += 1
        label.text = "dog:\(self.dog), cat: \(self.cat), bird:\(self.bird)"
       
        let nvc = SecondViewController()
        nvc.imgView.image = UIImage(named: "cat")
        if self.cat < 11 {
             nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true) }
    }
    
    @objc func birdDidTouch(){
        self.bird += 1
        label.text = "dog:\(self.dog), cat: \(self.cat), bird:\(self.bird)"
        let nvc = SecondViewController()
        nvc.imgView.image = UIImage(named: "bird")
        if self.bird < 16 {
            nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true) }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50+view.safeAreaInsets.top).isActive  = true
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        stackView.addArrangedSubview(dogButton)
        stackView.addArrangedSubview(catButton)
        stackView.addArrangedSubview(birdButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
    }
    
    func setupUI(){
        label.text = "dog:\(self.dog), cat: \(self.cat), bird:\(self.bird)"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(label)
        
        dogButton.setTitle("dog", for: .normal)
        dogButton.setTitleColor(.black, for: .normal)
        dogButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        dogButton.addTarget(self, action: #selector(dogDidTouch), for: .touchUpInside)
        dogButton.backgroundColor = .yellow
        view.addSubview(dogButton)
        
        catButton.setTitle("cat", for: .normal)
        catButton.setTitleColor(.black, for: .normal)
        catButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        catButton.addTarget(self, action: #selector(catDidTouch), for: .touchUpInside)
        catButton.backgroundColor = .orange
        view.addSubview(catButton)
        
        birdButton.setTitle("bird", for: .normal)
        birdButton.setTitleColor(.black, for: .normal)
        birdButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        birdButton.addTarget(self, action: #selector(birdDidTouch), for: .touchUpInside)
        birdButton.backgroundColor = .red
        view.addSubview(birdButton)
    }

}

