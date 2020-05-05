//
//  TableView02.swift
//  BasicTableView
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
  
  override var description: String { "TableView - Section" }
  
  /***************************************************
   섹션을 나누어 데이터 목록 출력하기
   ***************************************************/
    
  lazy var sectionTitles: [String] = fruitsDict.keys.sorted()
  let fruitsDict = [
    "A": ["Apple", "Avocado"],
    "B": ["Banana", "Blackberry"],
    "C": ["Cherry", "Coconut"],
    "D": ["Durian"],
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
  }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    
    //섹션 몇개 쓸거야???
    func numberOfSections(in tableView: UITableView) -> Int {
        fruitsDict.count
    }
    
    
    //numberOfRowsInSection  섹션에 몇개의 행이 들어갈거야?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titles = fruitsDict.keys.sorted()   //sorted() 자체가 배열로 반환해준다. ->  ["A", "B", "C", "D"]
        let key = titles[section] // titles[0] -> A ,   titles[1] -> B
        return fruitsDict[key]!.count // fruitsDict["A"] -> ["Apple", "Avocado"].count ==> 2ro
        //    return fruitsDict[sectionTitles[section]]!.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        let fruits = fruitsDict[sectionTitles[indexPath.section]]! // A,B,C,D
        cell.textLabel?.text = "\(fruits[indexPath.row])" //["Apple", "Avocado"]
        return cell
    }
}
//lazy var sectionTitles: [String] = fruitsDict.keys.sorted()
//let fruitsDict = [
//  "A": ["Apple", "Avocado"],
//  "B": ["Banana", "Blackberry"],
//  "C": ["Cherry", "Coconut"],
//  "D": ["Durian"],
//]
