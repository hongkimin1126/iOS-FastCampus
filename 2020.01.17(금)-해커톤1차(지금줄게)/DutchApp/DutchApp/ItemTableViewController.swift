//
//  ItemTableViewController.swift
//  DutchApp
//
//  Created by MyMac on 2020/01/16.
//  Copyright © 2020 Team Dutch. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    let cell = TableViewCustomCell()
    var items: [String] = []
    var dates: [String] = []
    var amounts: [Int] = []
    var numberOfPerson:[Int] = []
    var selectedBank: [String] = []
    var accountHolder: [String] = []
    var accountNo: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)          //안쓰는 셀 감추는 기능
        self.setNaviBar()
        self.setTabBar()
        self.navigationItem.title = "항목"
        let attrs = [
             NSAttributedString.Key.font: UIFont(name: "NanumSquareRoundR", size: 20)
         ]
         self.navigationController?.navigationBar.titleTextAttributes = attrs as [NSAttributedString.Key : Any]
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: "itemCell")
        tableView.estimatedRowHeight = 50
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let decoder = JSONDecoder()
        
        items = []
        dates = []
        amounts = []
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! TableViewCustomCell
        
        let itemData = items[indexPath.row]
        let detailDate = dates[indexPath.row]
        let subtitle = amounts[indexPath.row]
        
        cell.item.text = itemData
        cell.item.font = UIFont(name: "NanumSquareRoundR", size: 15)
        cell.date.text = detailDate
        cell.date.font = UIFont(name: "NanumSquareRoundR", size: 10)
        
        cell.amounts.text = amountToString(amount: "\(subtitle)")! + "원"
        cell.amounts.font = UIFont(name: "NanumSquareRoundR", size: 15)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shareVC = ShareViewController()
        let bank = selectedBank[indexPath.row]
        let amount = String(amounts[indexPath.row])
        let accountNumber = accountNo[indexPath.row]
        let holder = accountHolder[indexPath.row]
        
        if !selectedBank.isEmpty && !accountNo.isEmpty && !accountHolder.isEmpty {
            SimpleToss().POSTrequest(bank: bank, account: accountNumber, amount: holder) { (result) in
                shareVC.receiveTossUrl = "\(result.success.link)"
            }
        }
        shareVC.receiveSubject = items[indexPath.row]
        shareVC.receiveTotalPrice = String(amount)
        shareVC.receiveTotalPerson = String(numberOfPerson[indexPath.row])
        shareVC.receiveTotalPriceN = String(amounts[indexPath.row] / numberOfPerson[indexPath.row])
        shareVC.receiveDepositAccountLabel = accountFlat(bank, accountNumber, holder)
        shareVC.receiveDate = dates[indexPath.row]
    
        self.navigationController?.pushViewController(shareVC, animated: true)
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "삭제확인", message: "삭제할까요?", preferredStyle: .alert)
            let action = UIAlertAction(title: "삭제", style: .destructive){ (action) in
                
                self.tableView.reloadData()
            }
            let action2 = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(action)
            alert.addAction(action2)
            present(alert, animated: true)
            
        }
    }
}

