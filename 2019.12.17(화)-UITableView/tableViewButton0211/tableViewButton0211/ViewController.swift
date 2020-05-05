//
//  ViewController.swift
//  tableViewButton0211
//
//  Created by 홍기민 on 2020/02/11.
//  Copyright © 2020 hongkimin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let tableView = UITableView()
    var data = Array(1...50)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.rowHeight = 80
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
    }
    @objc func didTabButton(_ sender: UIButton) {
        let cell = sender.superview!.superview as! CustomCell
        
        guard let row = tableView.indexPath(for: cell)?.row else {return}
        
        let addNumber = data[row] + 1
        data[row] = addNumber
        cell.label.text = "\(addNumber)"
        
   
        
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else{ return UITableViewCell()}
        cell.label.text = "\(data[indexPath.row])"
        cell.myButton.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        return cell
    }
    
    
}
