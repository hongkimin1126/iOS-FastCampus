//
//  TableViewLifeCycle.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewLifeCycle: UIViewController {
  
  override var description: String { "TableView - LifeCycle" }
  
  let data = Array(1...40)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.delegate = self // 밑에서 익스텐셔에 delegate써서 싸용할려면 여기에 선언해줘야 한다.
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
//    tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "CellId")// 커스텀셀: 앱 사이클 자세히 볼려고 만든 클래스!!
    view.addSubview(tableView)
  }
}

// MARK: - UITableViewDataSource

extension TableViewLifeCycle: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel!.text = "Cell \(indexPath.row)"
    print("cellForRowAt : \(indexPath.row)") //실제로는 0~14까지만 화면에 나타난다
    return cell
  }
}

extension TableViewLifeCycle: UITableViewDelegate {
    //tableView.delegate = self 이거 위에 선어안한다면 코드 사용할수 없다.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("will Display cell: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("didEnd Displaying cell: \(indexPath.row)")
    }
}
