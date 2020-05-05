//
//  ViewController.swift
//  testtest
//
//  Created by 박지승 on 2020/01/20.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    private let scrollView = UIScrollView(frame: .zero)
    private let blueView = UIView()
    private let yellowView = UIView()
    private let redView = UIView()
    private let pageControl = UIPageControl() //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        baseUI()
        autoLayout()
        scrollView.isPagingEnabled = true //페이지방식으로 넘어감.
        pageControl.numberOfPages = 3 //(...)이 3개 생성된다.
        scrollView.delegate = self
        
    }
    
    func baseUI() {
        scrollView.backgroundColor = .black
        blueView.backgroundColor = .blue
        yellowView.backgroundColor = .yellow
        redView.backgroundColor = .red
        
        view.addSubview(scrollView)
        //addSubview 를 한 순서대로 생성된다.
        scrollView.addSubview(blueView)
        scrollView.addSubview(yellowView)
        scrollView.addSubview(redView)
        view.addSubview(pageControl)
        
    }
    
    func autoLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        let safeView = view.safeAreaLayoutGuide
        
        scrollView.topAnchor.constraint(equalTo: safeView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor).isActive = true
        
        scrollView.heightAnchor.constraint(equalTo: safeView.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: safeView.widthAnchor).isActive = true
        
        //for문 사용해서 오토레이아웃 잠음!!!!
        let views = [blueView, yellowView, redView]
        for view in views {
            view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            view.widthAnchor.constraint(equalTo: safeView.widthAnchor).isActive = true
            view.heightAnchor.constraint(equalTo: safeView.heightAnchor).isActive = true
            
        }
        blueView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: yellowView.leadingAnchor).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        pageControl.bottomAnchor.constraint(equalTo: safeView.bottomAnchor, constant: -32).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: safeView.centerXAnchor).isActive = true
        
    }
    
}

extension ViewController: UIScrollViewDelegate { 
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("didEndDecelerating")
        
        let index = scrollView.contentOffset.x / scrollView.bounds.width
        
        pageControl.currentPage = Int(index)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("didScroll")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        print("end Dragging")
    }
    
}
