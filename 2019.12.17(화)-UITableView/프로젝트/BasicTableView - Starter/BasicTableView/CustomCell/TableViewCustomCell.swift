 //
//  TableViewCustomCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCustomCell: UIViewController {
  
  /***************************************************
   커스텀 셀 사용하기
   ***************************************************/
  
  override var description: String { "TableView - CustomCell" }
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 80
    view.addSubview(tableView)
  }
}

// MARK: - UITableViewDataSource

extension TableViewCustomCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
    //이걸 가장만이 사용한다.
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as? CustomCell else {return UITableViewCell()}
    // --> 이거 쓰지 말라는 거야???
    cell.myLabel
    

//    let cell: UITableViewCell
//    if indexPath.row.isMultiple(of: 2) {
//        cell =  tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as
//    } else {
//
//        cell =  tableView.dequeueReusableCell(withIdentifier: "Deafult", for: indexPath)
//    }
//    cell.textLabel?.text = "\(indexPath.row * 1000)"
    
    
    
    
    return cell
    
    
    
    
  }
}


// MARK: - UITableViewDelegate

extension TableViewCustomCell: UITableViewDelegate {
    
}

