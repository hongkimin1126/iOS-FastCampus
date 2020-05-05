//
//  Extesions.swift
//  WeatherForecast
//
//  Created by 신용철 on 2020/02/24.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation
import UIKit

extension Decodable {
    static func decode(
        from data: Data,
        decoder: JSONDecoder = JSONDecoder()
        ) throws -> Self {
        return try decoder.decode(self, from: data)
    }
}

extension Data {
    func decode<T>(
        to target: T.Type,
        decoder: JSONDecoder = JSONDecoder()
        ) throws -> T where T: Decodable {
        return try decoder.decode(target, from: self)
    }
}



extension CGRect {
    static var screenBounds: CGRect { return UIScreen.main.bounds }
    
    static func make(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

extension CGFloat {
    public static let screenWidth = UIScreen.main.nativeBounds.size.width  / UIScreen.main.nativeScale
    public static let screenHeight = UIScreen.main.nativeBounds.size.height / UIScreen.main.nativeScale
}

extension UIView {
    var x: CGFloat {
        get { return frame.origin.x }
        set { frame.origin.x = newValue }
    }
    var y: CGFloat {
        get { return frame.origin.y }
        set { frame.origin.y = newValue }
    }
    var width: CGFloat {
        get { return frame.width }
        set { frame.size.width = newValue }
    }
    var height: CGFloat {
        get { return frame.height }
        set { frame.size.height = newValue }
    }
    var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
    var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    var maxX: CGFloat {
        return frame.origin.x + frame.size.width
    }
    var maxY: CGFloat {
        return frame.origin.y + frame.size.height
    }
}

extension String {
    func size(with font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [.font : font])
    }
}

public protocol Then {}
extension NSObject: Then {}

extension Then where Self: AnyObject {
    func then(_ configure: (Self) -> Void) -> Self {
        configure(self)
        return self
    }
}

extension UIButton {
    func addTarget(action: Selector) {
        guard let vc = parentViewController else {
            fatalError("addSubview 메서드 호출 이후에 사용해야 함")
        }
        addTarget(vc, action: action, for: .touchUpInside)
    }
}

protocol Identifiable {
    static var identifier: String { get }
}
extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: Identifiable { }


extension UITableView {
    func register<Cell>(
        cell: Cell.Type,
        forCellReuseIdentifier reuseIdentifier: String = Cell.identifier
        ) where Cell: UITableViewCell {
        register(cell, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell where Cell: UITableViewCell {
        guard let cell = dequeueReusableCell(
            withIdentifier: reusableCell.identifier
            ) as? Cell else { fatalError("Could not find cell with identifier") }
        return cell
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            if let vc = nextResponder as? UIViewController {
                return vc
            }
        }
        return nil
    }
}
