//
//  UIViewExtension.swift
//  SlackNewWorkspaceUI
//
//  Created by Giftbot on 2020/01/16.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit //

extension UIView {  //UIView 하면?? 뷰컨트롤러에서 전부 사용할수 있어????????????????????????
    func addSubviews(_ views: [UIView]) { //뷰에 한번에 올리는 방법!
        views.forEach { addSubview($0) }
    }
    
    // MARK: - AutoLayoutAnchor Helper
    
    var layout: UIView {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    @discardableResult//앞에소 리턴은 돌려받았는데 사용하지 않아서 워닝뜬것을 해결하는것!    ?????????????????????????
    func top(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {// 옆에 Self는 타입아라 대문자고 밑에는 소문자이다.
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.topAnchor //Anchor가 닐이 아니면 superview!.safeAreaLayoutGuide.topAnchor
        topAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self //리턴을 왜 해주는가????????????????????
    }
    @discardableResult
    func leading(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.leadingAnchor
        leadingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func bottom(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.bottomAnchor
        bottomAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func trailing(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.trailingAnchor
        trailingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func centerX(equalTo anchor: NSLayoutXAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.centerXAnchor
        centerXAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    @discardableResult
    func centerY(equalTo anchor: NSLayoutYAxisAnchor? = nil, constant c: CGFloat = 0) -> Self {
        let anchor = anchor ?? superview!.safeAreaLayoutGuide.centerYAnchor
        centerYAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
}

