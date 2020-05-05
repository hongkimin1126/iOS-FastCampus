//
//  TableViewCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
  
  // 코드로 생성 시
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    print("\n---------- [ init(style:reuserIdentifier) ] ----------")   //만들때 불리는것
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    print("\n---------- [ prepareForReuse ] ----------")//리유즈 될때 불리는것
  }
  
  deinit {
    print("Deinit")
  }
}
