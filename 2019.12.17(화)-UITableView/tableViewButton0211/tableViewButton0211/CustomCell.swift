//
//  CustomCell.swift
//  tableViewButton0211
//
//  Created by 홍기민 on 2020/02/11.
//  Copyright © 2020 hongkimin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    let label = UILabel()
    let myButton = UIButton()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
     
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

    }
    
    func setupUI() {

        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        contentView.addSubview(label)
        
        
        myButton.setTitle("MyButton", for: .normal)
        myButton.setTitleColor(.white, for: .highlighted)
        myButton.backgroundColor = .black
        myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        contentView.addSubview(myButton)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        myButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true

        
        

        
    }
    
    
}
