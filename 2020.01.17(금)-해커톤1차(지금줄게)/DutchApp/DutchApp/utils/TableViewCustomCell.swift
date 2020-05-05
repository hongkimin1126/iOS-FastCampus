//
//  TableViewCustomCell.swift
//  DutchApp
//
//  Created by MyMac on 2020/01/16.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import UIKit

class TableViewCustomCell: UITableViewCell {
    let item = UILabel()
    let date = UILabel()
    let amounts = UILabel()

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setUI()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        let UIArray = [item, date, amounts]
        item.font = .systemFont(ofSize: 17)
        date.font = .systemFont(ofSize: 12)
        amounts.font = .systemFont(ofSize: 20)
        
        
        UIArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            item.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            item.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            amounts.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amounts.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
