//
//  TableViewNumbers.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewNumbers: UIViewController {
    
    /***************************************************
     1부터 50까지의 숫자 출력하기
     ***************************************************/
    
    override var description: String { "Practice 1 - Numbers" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame) //뷰에 사이즈와 똑같이 하겟다.
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        
        view.addSubview(tableView)
    }
}

extension TableViewNumbers: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
}
