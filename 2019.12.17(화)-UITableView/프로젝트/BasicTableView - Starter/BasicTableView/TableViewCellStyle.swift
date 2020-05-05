//
//  TableViewCellStyle.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewCellStyle: UIViewController {
  
  override var description: String { "TableView - CellStyle" }
  
  /***************************************************
                셀 스타일 4가지 (default,  subtitle,   alue1, v    alue2)
   ***************************************************/
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.rowHeight = 70
//    tableView.rowHeight = UITableView.automaticDimension 위에 70 고정값 지우고 이거 사용하면 오토레이아웃에 의해서 셀크기가 변한다. 이것보다는 위에 고정값이 정갈한듯.
 
    tableView.dataSource = self

    
    view.addSubview(tableView)
    
    //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")    //셀 등록하면 기본으로 style: .default 이다.
    // tableView.rowHeight = UITableView.automaticDimension // automaticDimension는 내부 크기에 따라서 셀의 크기 자동으로 조절해주는 기능.
   
    
    //UITableViewCell(홀수행), CustomCell(짝수행)
    tableView.register(UITableView.self, forCellReuseIdentifier: "Default")
    tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    
  }
}

// MARK: - UITableViewDataSource

extension TableViewCellStyle: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 재사용
        let cell: UITableViewCell
        
        if indexPath.row % 4 == 0 { //몇번째 행에서 내가 원하는 셀쓸를 선택하는 방법!!
            // 셀 재사용 시도 후 없으면 생성
            cell = tableView.dequeueReusableCell(withIdentifier: "Default")
                ?? UITableViewCell(style: .default, reuseIdentifier: "Default") //style: .default 는 디데티일 텍스트가 없음
        } else if indexPath.row % 4 == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle")
                ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")//style: .subtitle는 다있다.
        } else if indexPath.row % 4 == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Value1")
                ?? UITableViewCell(style: .value1, reuseIdentifier: "Value1")//style: .value1는 다있다.
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Value2")
                ?? UITableViewCell(style: .value2, reuseIdentifier: "Value2")//style: .value2는 이미지뷰가 빠진다
        }
        
        // 공통 속성 세팅
        cell.textLabel?.text = "\(indexPath.row * 1000)"
        cell.imageView?.image = UIImage(named: "bear")      // 테이블뷰 셀에 사진넣는 방법
        cell.accessoryType = .checkmark  //셀 오른쪽에 악세사리에 체크마크가 생긴다.
        
        return cell
    }
}

