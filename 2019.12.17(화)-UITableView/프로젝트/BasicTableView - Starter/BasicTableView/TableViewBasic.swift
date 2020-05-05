//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
    
    override var description: String { "TableView - Basic" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame)  //테이블뷰만들고
        tableView.dataSource = self                     //데이터소스 연걸 반드시 넣어야 한다 코드로 할때는 !!!!!!!!!!!!!!!!!!!!!!
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        //셀 아이디 등록 깡코딩으로 사용시
        //UITableViewCell.self -> .self는 타입을 넘겨주겠다는 의미 ->즉 UITableViewCell타입을 넘겨주겠다
        
        view.addSubview(tableView)
    }
}

extension TableViewBasic: UITableViewDataSource {
    //하나의 섹션에 몇 개의 로우(행)가 들어갈지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        //1) 새로운 셀 생성
        //        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
        //        cell.textLabel?.text = "\(indexPath.row)"
        //        return cell
        
        //2) 셀 재사용
        //CellID 있으면 셀에 reusableCell에 넣어줘
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        reusableCell.textLabel?.text = "\(indexPath.row)"
        return reusableCell
        //        indexPath.section
        //        indexPath.row
    }
}


